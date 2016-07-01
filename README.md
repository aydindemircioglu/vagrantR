# vagrantR

main purpose of this small vagrant box is to provide you with the latest R on latest ubuntu with latest gcc toolchain 
to allow for sanitized debugging.


# how-to

change to the vagrantR directory. make sure you have some gigs of hard drive space left. 
as the vagrant box will need 2048mb of memory, make also sure you have enough ram left.
(you might try to lower this, but be aware that compiling R might hen stop with a strange
"gcc: internal compiler error: Killed (program cc1)" error. alternative you might want to
add swap space.

if you are ready, start the party with

$ vagrant up

wait. it will update the os, download latest gcc 6.x and some packages, download R sources and compile them with the proper flags. 
grab some tea. to do some work, you can simply do

$ vagrant ssh

and there you are. start your R debugging.

if you messed up, you can just 

$ vagrant destroy

to get rid of everything and then restart with vagrant up.


# hints

you can adapt bootstrap.sh to your needs:

- if you have more than 2 cpu cores, change the line 'make -j2' at the bottom of the script to 'make -jX', with X the number of cpu cores you want to use. this will speed up compiling.

# thanks

this work depends on all the great stuff done by the R team, the vagrant team and so many more.
thanks and keep up the incredible work!

also, some lines were taken from https://gist.github.com/djvanderlaan/1e9beb75d2d595824efc
