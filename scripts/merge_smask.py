import sys, zlib, struct
def read_png(p):
    d=open(p,'rb').read(); assert d[:8]==b'\x89PNG\r\n\x1a\n'
    i=8; idat=b''; W=H=bd=ct=0
    while i<len(d):
        ln=struct.unpack('>I',d[i:i+4])[0]; t=d[i+4:i+8]; body=d[i+8:i+8+ln]
        if t==b'IHDR': W,H,bd,ct=struct.unpack('>IIBB',body[:10])
        elif t==b'IDAT': idat+=body
        i+=12+ln
    raw=zlib.decompress(idat); nc={0:1,2:3,4:2,6:4}[ct]; bpp=nc*bd//8; stride=W*bpp
    out=bytearray(); prev=bytearray(stride); pos=0
    for _ in range(H):                      # deshacer filtros PNG
        f=raw[pos]; pos+=1; line=bytearray(raw[pos:pos+stride]); pos+=stride
        for x in range(stride):
            a=line[x-bpp] if x>=bpp else 0; b=prev[x]; c=prev[x-bpp] if x>=bpp else 0
            if   f==1: line[x]=(line[x]+a)&255
            elif f==2: line[x]=(line[x]+b)&255
            elif f==3: line[x]=(line[x]+(a+b)//2)&255
            elif f==4:
                p=a+b-c; pa,pb,pc=abs(p-a),abs(p-b),abs(p-c)
                line[x]=(line[x]+(a if pa<=pb and pa<=pc else b if pb<=pc else c))&255
        out+=line; prev=line
    return W,H,nc,bytes(out)
def write_rgba(p,W,H,px):
    rows=b''.join(b'\x00'+px[y*W*4:(y+1)*W*4] for y in range(H))
    def ch(t,d):
        c=t+d; return struct.pack('>I',len(d))+c+struct.pack('>I',zlib.crc32(c))
    open(p,'wb').write(b'\x89PNG\r\n\x1a\n'+ch(b'IHDR',struct.pack('>IIBBBBB',W,H,8,6,0,0,0))
        +ch(b'IDAT',zlib.compress(rows,9))+ch(b'IEND',b''))
img,mask,dst=sys.argv[1],sys.argv[2],sys.argv[3]
W,H,nc,a=read_png(img); W2,H2,nc2,m=read_png(mask)
assert (W,H)==(W2,H2), "imagen y mascara de distinto tamano"
px=bytearray()
for i in range(W*H):
    px+=bytes((a[i*nc],a[i*nc+1],a[i*nc+2],m[i*nc2]))
write_rgba(dst,W,H,bytes(px))
print(f"recompuesto -> {dst}  ({W}x{H} RGBA)")
