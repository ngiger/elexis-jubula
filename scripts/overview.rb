#!/usr/bin/env ruby
# Helper script to generate an overview of the Jubula runtime
require 'graphviz'
Inch = 2.56
TimePattern = '%Y.%m.%d'

# Folgende Tricks gebraucht, damit die Info schön aussieht
# * invisible edges, da sonst von links nach rechts geordnet wird
# * shape rectangle
# * fixedsize, width, height definiert, damit alles gleich gross ist
# * \l innerhalb einer Zeile, damit die Zeile linksbündig ausgeben wird
def gen_overview
  g = GraphViz.new( :G)
  use_colors = [ 'magenta',
                'cyan',
                'orange',
                'yellow',
                'chartreuse',
                ]
  index = 0
  all = { 'mysql' => { :comment => 'MySQL Datenbank server\lInhalt geht nach jedem Lauf verloren!\l', },
          'postgres' => { :comment => 'PostgreSQL Datenbank server\lInhalt geht nach jedem Lauf verloren!\l', },
          'jenkinstest' => { :comment => 'JENKINSTEST: Debian-Wheezy basierend mit\n' +
                             'Xvfb + metacity\nJava8 + Maven\nJubula\n' +
                             'Ruft die eigentlichen Test wie folgt auf\nmvn integration-test -Dtest_to_run=Smoketest\n',
                             },
        }
  objects = {}
  c2 = g.subgraph do |c|
    c[:rank => "same"]
    all.each do |key, value|
      objects[key] = g.add_nodes(value[:comment],
                            :fillcolor  => 'white',
                            :shape => 'rectangle',
                            :style  => 'filled' )
      index += 1
      index = (index % use_colors.size)
    end
  end
  objects['jenkinstest'][:fillcolor]  = 'yellow'
  objects['results'] = g.add_nodes('testexec.sh, Screenshot, logs, config findet man unter results\l',
                                   :shape => 'none')
  objects['config'] = g.add_nodes("Konfiguration durch\\n* definitions/*yml\\l* env: USE_X11\\l", :shape => 'none')
  objects['rake'] = g.add_nodes("rake -T für Entwickler.\\nZ.B. lokal via XVfb", :shape => 'none')
  objects['footnote'] = g.add_nodes("Stand: #{Time.now.strftime(TimePattern)}", :shape => 'none')
  g.add_edges( objects['jenkinstest'], objects['mysql']) #, 'style' => 'invis')
  g.add_edges( objects['jenkinstest'], objects['postgres']) #, 'style' => 'invis')
  g.add_edges( objects['jenkinstest'], objects['results'], 'style' => 'invis')
  g.add_edges( objects['mysql'], objects['results'], 'style' => 'invis')
  g.add_edges( objects['postgres'], objects['results'], 'style' => 'invis')
  g.add_edges( objects['results'], objects['config'], 'style' => 'invis')
  g.add_edges( objects['config'], objects['rake'], 'style' => 'invis')
  g.add_edges( objects['rake'], objects['footnote'], 'style' => 'invis')


  # Generate output image
  g.output( :svg => "#{File.basename(__FILE__, '.rb')}.svg" )
end

gen_overview