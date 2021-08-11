
<div class="w3-container">
<h2>The Observatory</h2>

[% tab_list = [
    { t => 'obs_build',  title => 'Build'  },
    { t => 'obs_tour',   title => 'Video Tour'  },
    { t => 'obs_equip',   title => 'Equipment'  },
   ]
%]
[% DEFAULT t = 'obs_build' %]
[% INCLUDE "$TG/navbar2.tpl" %]

<p />


[% INCLUDE "$TG/card.tpl" img="2019/build/IMG_8466.jpg" title="Building the Dome" page_link="obs_build" text="
Building the NexDome observatory.
" %]

[% INCLUDE "$TG/card.tpl" img="card/dome-tour.jpg" title="Observatory Tour" page_link="obs_tour" text="
Video tour of the completed observatory dome.
" %]



</div>






