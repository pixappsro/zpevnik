\version "2.18.2"
  #(set-default-paper-size "a5portrait")
  #(set-global-staff-size 20)

global = {
  \key f \major
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
     \set chordNameLowercaseMinor = ##t
     f2*2 g:m
     c:7 f2*4 g2*2:m
     c2*2 f2*4 b2*2
     c2*4:7
     f2*2 b
     c:7 f2*2
     
     s2*3
     
     d2*3 
     
     b2*2 c:7 
     a:m d:m 
     g:m c:7
     
     f2*4
     
     f2*1 c:7 f2*2
     
     
    }
    \new Staff \with {
              \override StaffSymbol.thickness = #2
     }{

      \new Voice = "melody" {  \relative c' {
        \global

        % Music follows here.
        \mark\markup\box{\bold \large "Ref."}
      c4 f a f
      g2 bes8 a g f
      e4 g c, e
      f2 a
      
      c,4 f a f
      g2 bes8 a g f
      e4 g c, e
      
      f4 r4 
      {s1*0_\markup\tiny{\italic "Fine"}} 
      \once \override TextScript #'X-offset = #-2 r2^\markup\line\small{\box{"B"}}
      
      \bar "|."
      
      \mark\markup\box{\bold \large "A"}
      a2 a4 a
      bes2 bes4 bes8 a
      g4 g8 g g4 g8 f
      e4 f g r
      
      a2 a4 a
      bes2 bes4 a
      g g f e
      f4 r4 r2^\markup\line{\tiny \italic "D.C. al" \box "B"}
      
      % http://lilypond.web.fc2.com/latest/Documentation/snippets/repeats.html#repeats-positioning-segno-and-coda-_0028with-line-break_0029
     % \once \override TextScript #'word-space = #1.5
     % \once \override TextScript #'X-offset = #8
     % \once \override TextScript #'Y-offset = #1.5
     % | s1*0^\markup { \center-column  { "" \line "Ref" }}
\bar "||"
    \cadenzaOn
      \stopStaff
        % Some examples of possible text-displays

        % text line-aligned
        % ==================
        % Move text to the desired position
        % \once \override TextScript #'extra-offset = #'( 2 . -3.5 )
        % | s1*0^\markup { D.S. al Coda } }

        % text center-aligned
        % ====================
        % Move text to the desired position
        % \once \override TextScript #'extra-offset = #'( 6 . -5.0 )
        % | s1*0^\markup { \center-column { D.S. "al Coda" } }

        % text and symbols center-aligned
        % ===============================
        % Move text to the desired position and tweak spacing for optimum text alignment
        %\once \override TextScript #'extra-offset = #'( 8 . -5.5 )
        \once \override TextScript #'word-space = #0
        \once \override TextScript #'X-offset = #2.5
        \once \override TextScript #'Y-offset = #-1
        | s1*0^\markup { \center-column { \italic "refrén" } }

        % Increasing the unfold counter will expand the staff-free space
        \repeat unfold 2 {
          s4 s4 
          \bar ""
        }
        % Resume bar count and show staff lines again
     \startStaff
   \cadenzaOff
   

      \bar "" \once \override TextScript #'X-offset = #-3 \once \override TextScript #'Y-offset = #0 s2^\markup\box{\bold \large "B"}
      a2 bes c 
      \repeat volta 2 { 
      d2. f4
      e d c bes
      c2. e4
      d c bes a
      bes2. d4
      c bes a g 
      }
      \alternative {
        {
          a r bes r
          c a bes c 
        }
        {
          a r g r
          f r r2^\markup\line{\tiny \italic "D.C. al Fine"}
        }
      }
       \bar "||"

    \cadenzaOn
      \stopStaff

        \once \override TextScript #'word-space = #0
        \once \override TextScript #'X-offset = #2.5
        \once \override TextScript #'Y-offset = #-1
        | s1*0^\markup { \center-column { \italic "refrén" } }

        % Increasing the unfold counter will expand the staff-free space
        \repeat unfold 2 {
          s4 s4 
          \bar ""
        }
        % Resume bar count and show staff lines again
   \cadenzaOff


      }
      }
    }
    \new Lyrics {
      \lyricsto "melody" {
     %        {\skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1} % přeskakuji předehru
     %        \set stanza = #"1. "
     %  O -- tví -- rá se po -- há -- dka,
     %  pro hol -- ky i klu -- ky
     %  \repeat unfold 2 { \skip 2 \skip 2 \skip 2 \skip 2 } % odskakuji 8 not(secondavolta), možno pokračovat dál v mšlodii
     tra la la la tra la la la la
     tra la tra la tra la
     tra la la la tra la la la la
     tra la tra la la
       }
    }
    \new Lyrics {
      \lyricsto "melody" {
    %         {\skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1 \skip 1} % přeskakuji předehru

     %  za -- ťu -- kej si na vrá -- tka
     %        \repeat unfold 2 { \skip 2 \skip 2 \skip 2 } % odskakuji 6 not(primavolta)
     %       ťu -- ky  ťu -- ky, ťu -- ky, ťu -- ky
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