\version "2.18.2"
  #(set-default-paper-size "a5portrait")
  #(set-global-staff-size 20)

global = {
  \key d \major % transponovat do D dur
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
     d4*2 e4*4 a4*2
     d4*4 a
     d4*3 a8*3:7 d8*7
     e4*2:m a fis:m b:m
     e:m a:7 d a d
    }
    \new Staff \with {
              \override StaffSymbol.thickness = #2
     }{
    
      \new Voice = "melody" {  \relative c' {
        \global
        
        % Music follows here.
        r8^\markup{\bold \large předehra} a b cis d e fis g
       \repeat volta 2 { a4^\markup{\bold \large sloka} fis | b4.  a8 | g e4. | a4 r }
       \alternative {
          { fis d d fis e a, r2 }
          { fis'8 d r4 fis8 d g e e d r4 | }
       }
       \bar "||"
       
       r8^\markup{\bold \large mezihra} fis g a b b16( a g8) fis e fis g e
       a a16( g fis8) e d e fis d
       g g16(fis e8) d cis d e cis
       d d' cis b a g fis e d4 r4 r2
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
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/10)
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