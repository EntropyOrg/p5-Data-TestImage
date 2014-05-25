package Data::TestImage;
# ABSTRACT: interface for retrieving test images

use strict;
use warnings;
use File::ShareDir 'dist_dir';
use Path::Class;
use Module::Load;

sub get_dist_dir {
	dir(dist_dir('Data-TestImage'));
}

sub install_package {
	...
}

sub get_image {
	my ($self, $image) = @_;
	for my $db (qw(Data::TestImage::Other Data::TestImage::USC::SIPI)) {
		load $db;
		my $image_file = $db->get_image($image);
		return $image_file if $image_file;
	}
}

1;
