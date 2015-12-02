#!/usr/bin/ruby -Ku
# coding: utf-8
#2015-02-12

require "KanConvFJ.rb"
require 'optparse'

#-----------------
opt = ARGV.getopts('FSJfsj')
noconv=0
if (opt["F"] && opt["f"]) ||
   (opt["S"] && opt["s"]) ||
   (opt["J"] && opt["j"])
then
   noconv=1
end

if (opt["F"] && opt["S"]) ||
   (opt["S"] && opt["J"]) ||
   (opt["J"] && opt["F"])
then
   abort("Error: can't set input-code multiple times.")
end

if (opt["f"] && opt["s"]) ||
   (opt["s"] && opt["j"]) ||
   (opt["j"] && opt["f"])
then
   abort("Error: can't set output-code multiple times.")
end

codein =0
codeout=0

codein = codein + (opt['F'] ? 1 : 0)
codein = codein + (opt['S'] ? 2 : 0)
codein = codein + (opt['J'] ? 4 : 0)
codein = 1 if 0==codein

codeout = codeout + (opt['f'] ?  8 : 0)
codeout = codeout + (opt['s'] ? 16 : 0)
codeout = codeout + (opt['j'] ? 32 : 0)
codeout = 32 if 0==codeout

flag = codein + codeout

#-----------------
ck = nil
if 0==noconv then
   ck = KanConvFJ.new()
end
ARGF.each do |line|
   if noconv>0 then
      print line
   else
      case flag
         when 17 then
                print ck.f2s(line.chomp)
         when 33 then
                print ck.f2j(line.chomp)
         when 10 then
                print ck.s2f(line.chomp)
         when 34 then
                print ck.s2j(line.chomp)
         when 12 then
                print ck.j2f(line.chomp)
         when 20 then
                print ck.j2s(line.chomp)
      end
      print "\n";
   end
end

