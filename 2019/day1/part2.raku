#!/usr/bin/env perl6

my $modules = "input".IO.lines.map(-> $mstr {:10($mstr)});
my $fuels = $modules.map(&fuelloop);
print $fuels.sum;

sub fuelloop(Int $weight) returns Int { 
  my $fuels = [ ];
  my $lastfuel = fuel($weight);
  while $lastfuel > 0 {
    $fuels.append($lastfuel);
    $lastfuel = fuel($lastfuel);
  }
  $fuels.sum
}

sub fuel(Int $weight) returns Int { ($weight/3).floor-2 }
