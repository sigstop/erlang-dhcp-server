beamdir = $(ERLANG_INSTALL_LIB_DIR_dhcp)/ebin
beam_DATA = dhcp.app dhcp_app.beam dhcp_sup.beam dhcp_server.beam dhcp_alloc.beam dhcp_lib.beam

bootdir = $(ERLANG_ROOT_DIR)/bin
boot_DATA = dhcp.boot dhcp.script

CLEANFILES = $(beam_DATA) $(boot_DATA) dhcp.rel

hrldir = $(ERLANG_INSTALL_LIB_DIR_dhcp)/include
hrl_DATA = dhcp.hrl dhcp_alloc.hrl

erldir = $(ERLANG_INSTALL_LIB_DIR_dhcp)/src
erl_DATA = dhcp_app.erl dhcp_sup.erl dhcp_server.erl dhcp_alloc.erl dhcp_lib.erl

privdir = $(ERLANG_INSTALL_LIB_DIR_dhcp)/priv
priv_DATA = dhcp.conf

EXTRA_DIST = dhcp_app.erl dhcp_sup.erl dhcp_server.erl dhcp_alloc.erl dhcp_lib.erl dhcp.hrl dhcp_alloc.hrl dhcp.conf

SUFFIXES = .erl .beam .rel .boot .script
.erl.beam:
	@ERLC@ @ERLCFLAGS@ $<
.rel.boot:
	@ERLC@ @ERLCFLAGS@ $<
.app.boot:
	@ERLC@ @ERLCFLAGS@ $<
