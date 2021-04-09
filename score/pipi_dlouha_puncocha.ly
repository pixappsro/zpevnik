\version "2.18.2"
#(set! paper-alist (cons '("ROZMER" . (cons (* 148 mm) (* 300 mm))) paper-alist))

 % #(set-default-paper-size "a5portrait")
   #(set-default-paper-size "ROZMER")
  #(set-global-staff-size 20)
\language czech


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
    \transpose f c
    { \chords {
     \germanChords
     \set chordNameLowercaseMinor = ##t
     s1*8

     f2*2 g:m
     c:7 f2*4 g2*2:m
     c2*2 f2*4 bes2*2
     c2*4:7
     f2*2 bes
     c:7 f2*2

     s2*3

     d2*3

     bes2*2 c:7
     a:m d:m
     g:m c:7

     f2*4

     f2*1 c:7 f2*2


  } }
    \new Staff \with {
              \override StaffSymbol.thickness = #2
     }{

      \new Voice = "melody" {
        \transpose f c {
      \relative c' {
        \global
        \grace <f c'>1 \normalsize \bar "||"
        \newSpacingSection
        \override Score.SpacingSpanner.spacing-increment = #0.4

        f2 f c'4 a2. bes8 a g f e4 g f a c,2
        f2 f c'4 a2. bes8 a g f e4 g f2 r
      \bar "||"
      \newSpacingSection
  \revert Score.SpacingSpanner.spacing-increment
        % Music follows here.
        \mark\markup\box{\bold \normalsize "sloka"}
      c4 f a f
      g2 bes8 a g f
      e4 g c, e
      f2 a

      c,4 f a f
      g2 bes8 a g f
      e4 g c, e

      f4 r4
      % {s1*0_\markup\tiny{\italic "Fine"}}
      \once \override TextScript #'X-offset = #-2 r2 % ^\markup\line\small{\box{"B"}}

      \bar "||"

      \mark\markup\box{\bold \normalsize "refrén"}
      a2 a4 a
      bes2 bes4 a
      g4 g g f
      e f g r

      a2 a4 a
      bes2 bes4 a
      g g f e
      f4 r4 r2 %^\markup\line{\tiny \italic "D.sloka al" \box "B"}

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
        | s1*0^\markup { \center-column { \italic "sloka" } }

        % Increasing the unfold counter will expand the staff-free space
        \repeat unfold 2 {
          s4 s4
          \bar ""
        }
        % Resume bar count and show staff lines again
     \startStaff
   \cadenzaOff
   \break

      \bar "" \once \override TextScript #'X-offset = #-3 \once \override TextScript #'Y-offset = #0 s2^\markup\box{\bold \normalsize "B"}
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
          f r r2 %^\markup\line{\tiny \italic "D.sloka al Fine"}
        }
      }
       \bar "||"

    \cadenzaOn
      \stopStaff

        \once \override TextScript #'word-space = #0
        \once \override TextScript #'X-offset = #2.5
        \once \override TextScript #'Y-offset = #-1
        | s1*0^\markup { \center-column { \italic "sloka" } }

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
    }
    \new Lyrics {
      \lyricsto "melody" {
       \repeat unfold 24 {\skip 1} % přeskakuji předehru (počet not)
     %        \set stanza = #"1. "
     %  O -- tví -- rá se po -- há -- dka,
     %  pro hol -- ky i klu -- ky
     %  \repeat unfold 2 { \skip 2 \skip 2 \skip 2 \skip 2 } % odskakuji 8 not(secondavolta), možno pokračovat dál v mšlodii
     \set stanza = #"1. "
     Pří -- běh za -- zpí -- vám tra la la la
     O sta -- te -- čné dí -- vce
     Já ji ta -- ky znám tra la la la
     Pi -- ppi jmé -- no má

     Hej Pi -- ppi hou Pi -- ppi
     Hej hou haj hou hý ha há
     Hej Pi -- ppi hou Pi -- ppi
     Dlou -- há Pun -- čo -- cha

     Já za -- vo -- lám,
     že na svě -- tě jsem rád, mů -- žu si s_vá -- mi hrát
     Za do -- bro -- druž -- stvím s_Pi -- ppi jdem'
     Co če -- ká
       }
    }
    \new Lyrics {
      \lyricsto "melody" {
        \repeat unfold 80 {\skip 1} % přeskakuji předehru (počet not)

        nás, to -- ho se ne -- bo -- jím, vždyť ka -- ma -- rá -- dy mám
        A spo -- lu vše -- chno
        \repeat unfold 6 { \skip 1 }
        do -- ká -- žem'.
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