%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% @doc
%%% @end
%%% @author Thomas Järvstrand <tjarvstrand@gmail.com>
%%% @copyright
%%% Copyright 2012 Thomas Järvstrand <tjarvstrand@gmail.com>
%%%
%%% This file is part of EDTS.
%%%
%%% EDTS is free software: you can redistribute it and/or modify
%%% it under the terms of the GNU General Public License as published by
%%% the Free Software Foundation, either version 3 of the License, or
%%% (at your option) any later version.
%%%
%%% EDTS is distributed in the hope that it will be useful,
%%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%% GNU General Public License for more details.
%%%
%%% You should have received a copy of the GNU General Public License
%%% along with EDTS. If not, see <http://www.gnu.org/licenses/>.
%%% @end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%_* Module declaration =======================================================
-module(edts_SUITE).

%%%_* Exports ==================================================================

%% API
-export([all/0]).

%% Test cases
-export([test/1]).

%%%_* Includes =================================================================

%%%_* Defines ==================================================================

%%%_* Types ====================================================================

%%%_* API ======================================================================

all() -> [test].

init_per_suite(Cfg) ->
  edts_server:start_link(),
  {ok, Host} = inet:gethostname(),
  slave:start(Host, "test_node"),
  Cfg.

init_per_test_case(TestCase, Cfg) ->
  ?MODULE:TestCase({init, Cfg}).

test(doc) ->
  "testing the tests.";
test({init, Cfg}) -> Cfg;
test({'end', Cfg}) -> ok;
test(Cfg) ->
  {ok, Names} = net_adm:names(),
  [] =/= [Name || {"test_node", _} = Name <- Names].


%%%_* Internal functions =======================================================

%%%_* Emacs ====================================================================
%%% Local Variables:
%%% allout-layout: t
%%% erlang-indent-level: 2
%%% End:

