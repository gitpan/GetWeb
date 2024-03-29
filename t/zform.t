#!/usr/bin/perl5

# must run after form.t during update cycle
# avoid running simultaneous versions

my $PERL = $^X;

my $orig = 't/ref.form/ref.';
my $new = 't/zform.rfc.tmp';

system("(echo From: the_user; cat $orig) | $PERL -pe 's!^(\\[ \\])( *?start search)!\\[X\\]\$2!'g > $new");

use t::GetWebTest;

t::GetWebTest::go("","",1,$new,'mail');
