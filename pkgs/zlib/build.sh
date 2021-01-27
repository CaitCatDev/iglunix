pkgver=1.2.11
pkgname=zlib
bad=""
ext="dev"

fetch() {
	curl https://zlib.net/zlib-1.2.11.tar.xz -o $pkgname-$pkgver.tar.gz
	tar -xf $pkgname-$pkgver.tar.gz
}

build() {
	cd $pkgname-$pkgver
	./configure \
		--prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR=$pkgdir
	rm $pkgdir/usr/lib/*.a
	rm -r $pkgdir/usr/include
	rm -r $pkgdir/usr/lib/pkgconfig
	rm -r $pkgdir/usr/share
}

package_doc() {
	cd $pkgname-$pkgver
	make install DESTDIR=$pkgdir
	rm -r $pkgdir/usr/bin
}

license() {
	cd $pkgname-$pkgver
	cat LICENSE
}