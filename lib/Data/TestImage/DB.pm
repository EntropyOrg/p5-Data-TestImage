package Data::TestImage::DB;
# ABSTRACT: an abstract class for an image database

use strict;
use warnings;
use List::AllUtils qw(first);
use Path::Class;

=method get_db_dir

    get_db_dir()

Returns the top-level directory of this image database. This method must be
implemented by children of this class in order to use the default
implementations of L</get_installed_images>.

=cut 
sub get_db_dir {
	...
}

=method get_installed_images

    get_installed_images()

Returns a list of all installed images in the database. Each image is returned
as a L<Path::Class::File>.

=cut
sub get_installed_images {
	my ($self) = @_;
	my @list;
	$self->get_db_dir->recurse( callback => sub {
		push @list, $_[0] if -f $_[0];
	});
	\@list;
}

=method get_image

    get_image( $image_name )

Returns the first image file (as a L<Path::Class::File>) from
L</get_installed_images> that has a filename that matches the string
C<$image_name>. 

=cut
sub get_image {
	my ($self, $image) = @_;
	first { "$_" =~ /\Q$image\E/ } @{ $self->get_installed_images };
}

=method install_package

    install_package($args, %opt)

A DB child can optionally implement this method in order to pass in arguments
for installing further images.

Keys in in C<%opt> may include:

=over 4

=item C<verbose>: a boolean indicating whether the install process should output information as it installs.

=back

=cut
sub install_package {
	...
}

1;
