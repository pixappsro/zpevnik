\version "2.18.2"
  #(set-default-paper-size "a5portrait")
  #(set-global-staff-size 20)

global = {
  %\key d \major % transponovat do D dur
  \time 2/2
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
     
    }
    \new Staff \with {
              \override StaffSymbol.thickness = #2
     }{
      \new Voice = "melody" {  \relative c' {
        \global
        \mark\markup\box{\bold \normalsize "refrén"}
        c4 c8 d e g g4
        c,8 c c d e2
        c4 c8 d e g g4
        e8 e e d c2
        \bar "||"\break
        \mark\markup\box{\bold \normalsize "sloka"}
         c8 c c d e g g g
        \set fontSize = -3
        c,8 c c d e g g g
        \set fontSize = 0
        e8 e e d e d c c 
        \set fontSize = -3
        e8 e e d e d c c 
        \set fontSize = 0

        c8 c c d e g g4
        \set fontSize = -3
        c,8 c c d e g g4
        \set fontSize = 0
        
        e8 e e d e d c4 
        \set fontSize = -3
        e8 e e d e d c4 
        \bar "|."
      }}
    }
    \new Lyrics {
      \lyricsto "melody" {
       %\set stanza = #"1. "
       Wow ha -- y  -- a -- y -- é     
       ha -- y  -- a -- y -- é 
       
       Wow ha -- y  -- a -- y -- é     
       ha -- y  -- a -- y -- é 
       
       In -- di -- á -- nky, In -- di -- á  -- ni
       \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1
       pojď -- te vši -- chni zpí -- vat s_ná -- mi
       \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1
       
       My jsme par -- ta ve -- se -- lá
       \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 
       od vel -- ké -- ho je -- ze -- ra
       \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 
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