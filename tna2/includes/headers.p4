#ifndef _HEADERS_
#define _HEADERS_

header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> ether_type;
}

header ipv4_t {
    bit<4>  version;
    bit<4>  ihl;
    bit<8>  diffserv;
    bit<16> len;
    bit<16> identification;
    bit<3>  flags;
    bit<13> frag_offset;
    bit<8>  ttl;
    bit<8>  protocol;
    bit<16> hdr_checksum;
    bit<32> src_addr;
    bit<32> dst_addr;
}

header tcp_t {
    bit<16> src_port;
    bit<16> dst_port;
    bit<32> seq_no;
    bit<32> ack_no;
    bit<4>  data_offset;
    bit<3>  res;
    bit<3>  ecn;
    bit<6>  ctrl;
    bit<16> window;
    bit<16> checksum;
    bit<16> urgent_ptr;
}

header udp_t {
    bit<16> src_port;
    bit<16> dst_port;
    bit<16> length_;
    bit<16> checksum;
}

header icmp_t {
    bit<8> type;
    bit<8> code;
    bit<16> hdrChecksum;
}

header foo_t {
    bit<16> decay;
    bit<16> mac_ip_src_mean;
    bit<16> mac_ip_src_std_dev;
    bit<16> ip_src_mean;
    bit<32> pkt_cnt_global;
    bit<32> mac_ip_src_pkt_cnt;
    bit<32> ip_src_pkt_cnt;
    bit<32> ip_pkt_cnt;
    bit<32> ip_mean;
    bit<32> ip_std_dev;
    bit<32> ip_magnitude;
    bit<32> ip_radius;
    bit<32> five_t_pkt_cnt;
    bit<32> five_t_mean;
    bit<32> five_t_std_dev;
    bit<32> five_t_magnitude;
    bit<32> five_t_radius;
    bit<64> ip_cov;
    bit<64> ip_pcc;
    bit<64> five_t_cov;
    bit<64> five_t_pcc;
    bit<16> ip_src_std_dev;
}

header meta_t {
    bit<16> l4_src_port;
    bit<16> l4_dst_port;
    bit<32> pkt_cnt_global;
    bit<32> current_ts;
    bit<32> pkt_len_squared;
    bit<16> decay_cntr;
}

header hash_meta_t {
    bit<16> mac_ip_src;
    bit<16> ip_src;
    bit<16> ip_0;
    bit<16> ip_1;
    bit<16> ip_sub_abs;
    bit<16> five_t_0;
    bit<16> five_t_1;
    bit<16> five_t_sub_abs;
}

// Aux metadata for the 1D-only flow keys.
header stats_meta_1d_t {
    bit<32> decay_check;
    bit<32> pkt_cnt;
    bit<32> pkt_len;
    bit<32> ss;
    /* bit<32> mean; */
    bit<32> mean_ss;
    bit<32> mean_sqr;
    bit<32> variance;
    bit<32> variance_neg;
    /* bit<32> std_dev; */
}

// Aux metadata for the 1D and 2D flow keys.
header stats_meta_t {
    bit<32> decay_check;
    bit<32> pkt_cnt_0;
    bit<32> pkt_cnt_1;
    bit<32> pkt_len;
    bit<32> ss_0;
    bit<32> ss_1;
    bit<32> mean_0;
    bit<32> mean_1;
    bit<32> mean_ss_0;
    bit<32> mean_ss_1;
    bit<32> mean_sqr_0;
    bit<32> mean_sqr_1;
    bit<32> res_check;
    bit<32> res_0;
    bit<32> res_0_old;
    bit<32> res_1;
    bit<32> variance_0;
    bit<32> variance_0_neg;
    bit<32> variance_0_abs;
    bit<32> variance_1;
    bit<32> variance_1_neg;
    bit<32> variance_1_abs;
    bit<32> variance_sqr_0;
    bit<32> variance_sqr_1;
    bit<32> std_dev_0;
    bit<32> std_dev_1;
    bit<32> std_dev_prod;
    bit<32> magnitude;
    bit<32> radius;
    bit<64> res_prod;
    bit<64> sum_res_prod;
    /* bit<64> cov; */
    /* bit<64> pcc; */
}

struct res_current {
    bit<32> res_0_old;
    bit<32> res_1;
}

struct decay_cntr {
    bit<16> cur_pkt;
    bit<16> value;
}

struct ingress_metadata_t {
    meta_t 	            meta;
    hash_meta_t         hash;
    stats_meta_1d_t     stats_mac_ip_src;
    stats_meta_1d_t     stats_ip_src;
    stats_meta_t        stats_ip;
    stats_meta_t        stats_five_t;
}

struct egress_metadata_t {}

struct header_t {
    ethernet_t	    ethernet;
    ipv4_t		    ipv4;
    tcp_t		    tcp;
    udp_t		    udp;
    icmp_t 		    icmp;
    foo_t     foo;
}

#endif
