\version "2.18.2"
  #(set-default-paper-size "a5portrait")
  #(set-global-staff-size 20)

global = {
  \key es \major
  \time 2/4
}
\paper {
  system-system-spacing = 
    #'(
        (basic-distance . 0.1)
        (padding . 1)
      )

  top-margin = 0\cm
  left-margin = 0\cm
  right-margin = 0\cm
  bottom-margin = 0\cm
}
 % \markup { \vspace #3 }

\header {
  tagline = ""  % remove footer
}
\score {
  <<
   \chords {
     \set chordNameLowercaseMinor = ##t
      {\skip 2 \skip 2 } % přeskakuji předehru
     es4*2 f4*4 b4*2
     es4*4 b
     es4*3 b8*3:7 es8*7
     f4*2:m b g:m c:m
     f:m b:7 es b es 
    }
    \new Staff \with {
              \override StaffSymbol.thickness = #2
     }{
    
      \new Voice = "melody" {\relative c'' {
        \global
        
        % Music follows here.
        r8 bes, c d es f g as 
       \repeat volta 2 { bes4^\markup{\bold \large sloka} g | c4.  bes8 | as f4. | bes4 r } 
       \alternative {
          { g es es g f bes, r2 }
          { g'8 es r4 g8 es as f f es r4 | }
       }
       \bar "||"
       
       r8^\markup{\bold \large mezihra} g as bes c c16( bes as8) g f g as f
       bes bes16( as g8) f es f g es
       as as16(g f8) es d es f d 
       es es' d c bes as g f es4 r4
       \bar "|."

       
      }
      }
    }
    \new Lyrics {
      \lyricsto "melody" {
             {\skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1} % přeskakuji předehru
             \set stanza = #"1. "
       O -- tví -- rá se po -- há -- dka,
       pro hol -- ky i klu -- ky
       \repeat unfold 2 { \skip 2 \skip 2 \skip 2 \skip 2 } % odskakuji 8 not(secondavolta), možno pokračovat dál v mšlodii 
       
       }
    }
    \new Lyrics {
      \lyricsto "melody" {
             {\skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1} % přeskakuji předehru

       za -- ťu -- kej si na vrá -- tka 
             \repeat unfold 2 { \skip 2 \skip 2 \skip 2 } % odskakuji 6 not(primavolta)
            ťu -- ky  ťu -- ky, ťu -- ky, ťu -- ky
      }
    }


  >>
  \layout { 
        indent = 0\in
    \context {
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
      \remove "Bar_number_engraver"
    }
  }
  \midi {
    \tempo 4=100
  }
}

\markup {
      \halign #-5

  \general-align #Y #1.2   {
    %\epsfile #X #25 #"zizala.eps"
  }
}