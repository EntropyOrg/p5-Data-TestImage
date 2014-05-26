package Data::TestImage;
# ABSTRACT: interface for retrieving test images

use strict;
use warnings;
use File::ShareDir 'dist_dir';
use Path::Class;
use Module::Load;

=method get_dist_dir

    get_dist_dir()

Returns a L<Path::Class::Dir> object to the shared directory for the
C<Data-TestImage> distribution.

=cut
sub get_dist_dir {
	dir(dist_dir('Data-TestImage'));
}

=method get_image

    get_image( $image_name )

Calls L<Data::TestImage::DB/get_image> on L<Data::TestImage::DB::Other> and
L<Data::TestImage::DB::USC::SIPI>. Returns an instance of L<Path::Class::File>.

=cut
sub get_image {
	my ($self, $image) = @_;
	for my $db (qw(Data::TestImage::DB::Other Data::TestImage::DB::USC::SIPI)) {
		load $db;
		my $image_file = $db->get_image($image);
		return $image_file if $image_file;
	}
}

1;
=head1 SYNOPSIS

    use Data::TestImage;

    say Data::TestImage->get_image('mandrill')->basename;
    # 4.2.03.tiff

Produces the L<mandrill|http://zmughal.github.io/p5-Data-TestImage/USC/SIPI/mandrill.png> image.

=for html <div><img width="200" alt="Mandrill image" src="http://zmughal.github.io/p5-Data-TestImage/USC/SIPI/mandrill.png"/></div>

=cut

=head1 INSTALLATION

Some of the image databases can be configured to install more images at
configuration time. This can be accomplished by setting the
C<PERL_DATA_TESTIMAGE_INSTALL> environment variable prior to installation, for
example

    export PERL_DATA_TESTIMAGE_INSTALL="USC::SIPI=miscellaneous,sequences"
    cpanm Data::TestImage

See the database documentation for more information. Multiple databases can be
configured by putting a space between each sequence.

=cut
