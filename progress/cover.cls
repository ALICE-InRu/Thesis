\ProvidesClass{cover}[2015/01/30 Cover class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{letter}


%-------------------------------------------------------------------------------
%                overall design commands definitions
%-------------------------------------------------------------------------------

% MarVoSym font for symbols
%\RequirePackage{marvosym}
\newcommand*{\marvosymbol}[1]{}
%\ifxetexorluatex
%  \renewcommand*{\marvosymbol}[1]{{\fontspec{MarVoSym}\char#1}}
%\else
\renewcommand*{\marvosymbol}[1]{{\fontfamily{mvs}\fontencoding{U}\fontseries{m}\fontshape{n}\selectfont\char#1}}
%\fi

\newcommand*{\faxsymbol}{\marvosymbol{117}~}
\newcommand*{\emailsymbol}{\marvosymbol{66}~}
\newcommand*{\homepagesymbol}{{\Large\marvosymbol{205}}~}

% elements
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\familyname}[1]{\def\@familyname{#1}}
\newcommand*{\mobile}[1]{\faMobilePhone~{#1}}
\newcommand*{\fax}[1]{\faxsymbol~{#1}}
\newcommand*{\phone}[1]{\faPhone~{#1}}
\newcommand*{\github}[1]{\faGithub~{#1}}
\newcommand*{\email}[1]{\emailsymbol~\href{mailto:{#1}}{#1}}
\newcommand*{\homepage}[2]{\homepagesymbol~\href{#1}{#2}}
\newcommand*{\twitter}[1]{\faTwitterSign~\href{https://twitter.com/#1}{#1}}
\newcommand*{\facebook}[1]{\faFacebookSign~\href{https://facebook.com/#1}{#1}}
\newcommand*{\linkedin}[1]{\faLinkedinSign~\href{https://www.linkedin.com/in/#1}{#1}}
%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{indianred}{HTML}{CD5C5C}
\definecolor{seagreen}{HTML}{2E8B57}
\definecolor{azure}{HTML}{C1CDCD}
\ifdefined\@cv@print
\colorlet{green}{gray}
\colorlet{orange}{gray}
\colorlet{purple}{gray}
\colorlet{brown}{gray}
\colorlet{red}{gray}
\colorlet{blue}{gray}
\colorlet{indianred}{gray}
\colorlet{seagreen}{gray}
\colorlet{fillheader}{white}
\colorlet{header}{gray}
\else
\colorlet{fillheader}{gray}
\colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage{fontspec,xltxtra}

\newfontfamily\bodyfont[]{Arno Pro} %Helvetica Neue
\newfontfamily\thinfont[]{Arno Pro Italic} %Helvetica Neue UltraLight
\newfontfamily\headingfont[]{Arno Pro Caption} %Helvetica Neue Condensed Bold
\newfontfamily\boldfont[]{Arno Pro Bold} %Helvetica Neue UltraLight

\usepackage{fontawesome}

%%%%%%%%%%
% Header %
%%%%%%%%%%
\usepackage{fancyhdr}
\RequirePackage{tikz}

\newcommand{\myheader}{

	\begin{tikzpicture}[remember picture,overlay]
	\node [rectangle, fill=fillheader, anchor=north, minimum width=2\paperwidth, minimum height=4cm] (box) at (current page.north){};
	\node [anchor=center] (name) at (box) {%
		\fontsize{40pt}{72pt}\color{header}%
		{\boldfont \@firstName}\quad{\bodyfont  \@lastName}
	};
	\node [anchor=north] at (name.south) {%
		\fontsize{14pt}{24pt}\color{header}%
		\thinfont \@workTitle%
	};
	\end{tikzpicture}
}

\fancypagestyle{plain}{
	\fancyhf{ }
	\fancyfoot{ }
	\fancyhf[L]{\myheader}
}
\fancypagestyle{empty}{
	\fancyhf{ }
	\fancyfoot{ }
	\fancyhf[L]{\myheader}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[a4paper,top=5cm,left=2cm,right=2cm]{geometry}
\RequirePackage{hyperref}


%%%%%%%%%%%%%%%%
% Letter 
%%%%%%%%%%%%%%%%

% some definitions
\def\phonefrom#1{\gdef\@phonefrom{#1}}
\def\emailfrom#1{\gdef\@emailfrom{#1}}
\def\greetto#1{\gdef\@greetto{#1}}
\def\closeline#1{\gdef\@closeline{#1}}
\def\nameto#1{\gdef\@nameto{#1}}

\def\addrto#1{\gdef\@addrto{#1}}
\def\addrfrom#1{\gdef\@addrfrom{#1}}

\def\workTitle#1{\gdef\@workTitle{#1}}
\def\firstName#1{\gdef\@firstName{#1}}
\def\lastName#1{\gdef\@lastName{#1}}

\address{\@addrfrom\\ \phone{\@phonefrom} \\ \email{\@emailfrom}} % \\ \github{tungufoss}}
\newcommand{\myletter}[3]{
\begin{letter}
	{\@nameto \\ \@addrto}
	
	\opening{\@greetto}

    #1	
    
    \vfill
	\closing{\@closeline}
	\vfill
	
%	\ps	
%	P.S. #2 
%	\encl{#3}
		
\end{letter}}
%----------------------------------------------------------------------------------------

