package Data::TestImage::DB;

use strict;
use warnings;
use List::AllUtils qw(first);

sub get_db_dir {
	...
}

sub get_installed_images {
	my ($self) = @_;
	my @list;
	$self->get_db_dir->recurse( callback => sub {
		push @list, $_[0] if -f $_[0];
	});
	\@list;
}

sub get_image {
	my ($self, $image) = @_;
	first { "$_" =~ /\Q$image\E/ } @{ $self->get_installed_images };
}
