package Data::TestImage::DB::Other;
# ABSTRACT: other test images

use Data::TestImage;
use parent qw(Data::TestImage::DB);

use strict;
use warnings;

sub get_db_dir {
	Data::TestImage->get_dist_dir()->subdir(qw{ other });
}

1;

=head1 SYNOPSIS

    use Data::TestImage::DB::Other;

    my $camera_file = Data::TestImage::DB::Other->get_image('cameraman');
    say $camera_file->basename;
    # cameraman.tiff

=for html <div><img width="200" alt="Cameraman image" src="http://zmughal.github.io/p5-Data-TestImage/Other/cameraman.png"/></div>

=head1 INHERITANCE

=over 4

=item L<Data::TestImage::DB>

=back

=head1 DESCRIPTION

This image database currently contains just cameraman.tiff.

=cut
