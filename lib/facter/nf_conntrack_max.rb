# get the value of /proc/sys/net/netfilter/nf_conntrack_max
Facter.add("nf_conntrack_max") do
  confine :kernel => :linux
  setcode do
    if File.exist? "/proc/sys/net/netfilter/nf_conntrack_max"
      Facter::Util::Resolution.exec('/bin/cat /proc/sys/net/netfilter/nf_conntrack_max 2> /dev/null').chomp
    end
  end
end
