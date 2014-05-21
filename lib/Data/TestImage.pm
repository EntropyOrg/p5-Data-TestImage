package Data::TestImage;

use strict;
use warnings;
use File::ShareDir 'dist_dir';

# from <http://sipi.usc.edu/database/>
use constant USC_SIPI_IMAGE_DB_VOLUME => {
	textures => {
			volume => 1,
			description => 'Brodatz textures, texture mosaics, etc.',
			url => 'http://sipi.usc.edu/database/textures.tar.gz',
			alt_urls => [ '' ], # TODO
		},
	aerials => {
			volume => 2,
			description => 'High altitude aerial images',
			url => 'http://sipi.usc.edu/database/aerials.tar.gz',
			alt_urls => [ '' ], # TODO
		},
	miscellaneous => {
			volume => 3,
			description => 'Lena, the mandrill, and other favorites',
			url => 'http://sipi.usc.edu/database/misc.tar.gz',
			alt_urls => [ '' ], # TODO
		},
	sequences => {
			volume => 4,
			description => 'Moving head, fly-overs, moving vehicles',
			url => 'http://sipi.usc.edu/database/sequences.tar.gz',
			alt_urls => [ '' ], # TODO
		},
};


1;
