\version "2.18.2"
  #(set-default-paper-size "a5portrait")
  #(set-global-staff-size 20)

global = {
  %\key d \major % transponovat do D dur
  \time 4/4
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
     \germanChords
     \set chordNameLowercaseMinor = ##t
     s1
     c
     a:7
     d:m
     g
     d:m
     e:dim
     c
     a:7
     d:m
     g
     c
     a:7
     d:m
     e2
     d
     e
     d
     e
     d
     g4
     f4
     g2
     
     
     
    }
    \new Staff \with {
              \override StaffSymbol.thickness = #2
     }{
    
      \new Voice = "melody" {  \relative c' {
        \global
        c'4 b a g 
        g'8 e r4 r8 c8 b a 
        g'8 e r4 r8 g4 a8 
        d,2 r2
        d4 c b a
        a'8 f r4 r8 d c b 
        a'8 e r4 r8 a4 b8 e,2 r2
        
        e4 g8 g e4 cis
        e8 d d e f4 c b2 r8 a'4 as8 
        g2 r8 e g as 
        a4. b8 a4 e 
        g8 f f e  es4 b'8 a 
        as4 e8 d( d) r8 b'8 a 
        as4 e8 d( d) r8 b'8 a
        as4 e8 d( d) r8 e f  g g4 f8 g2
        %r1
        %r1
        %NEHOTOVE: c,8 r8 a' g r8 c, b r8 a' g r8 b, r8 a'  g r8 b,  c r8 c' g c, a' g b, c e g g e c b a g fis g
        
        
        \bar "|."
        

       
      }
      }
    }
    \new Lyrics {
      \lyricsto "melody" {
       %\set stanza = #"1. "
        Nej -- lep -- ší je Fer -- da, pro -- to -- že Fer -- da chy -- trák je.
        I když má své chy -- by, tak nám se lí -- bí, vy -- hra -- je.
        Bá -- je -- čně zpí -- vá, vždy -- cky na -- jde sprá -- vný rým
        a my s-ním.
        A pro -- to ště -- stí mí -- vá, jen se po -- dí -- vá,
        a hned s-ve -- se -- lou, za ním vši -- chni jdou,
        ces -- tou ne -- ces -- tou, le -- sem po -- hád -- ko -- vým.      
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