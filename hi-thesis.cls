% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "hi-thesis.cls",
%     version         = "1.10",
%     date            = "31 August 2015",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, hi-thesis",
%     supported       = "send email to hei2@hi.is",
%     docstring       = "A thesis class for a University of Iceland
%                        dissertation.",
%     note            = "Based on the Harvard dissertation class 
%                        by Jordan Suchow (suchow@fas.harvard.edu)"
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hi-thesis}[2015/08/22 v1.0 University of Iceland Thesis Class]
\LoadClass[11pt,b5paper,twoside,openany]{book} % UGthesis

% Required packages
\RequirePackage{changepage} % check if page is odd/even
\RequirePackage{pdfpages}
\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.eps, .ps, .pdf}
\graphicspath{{figures/EPS/}{figures/}}

\usepackage{packages/appendix}

\RequirePackage{hyperref}
\hypersetup{
    linktocpage,
    colorlinks,
    citecolor=black, % could be chaptergrey
    filecolor=black,
    linkcolor=black,
    urlcolor=black, % could be chaptergrey
    pdfauthor={\@author},
    pdftitle={\@title}   
}

\RequirePackage[centertags]{amsmath}
\RequirePackage{amssymb}

\RequirePackage[small, md, sc]{titlesec}

\RequirePackage{pdfsync} %do pdf synchronization [andy]
\RequirePackage[closeFloats, noSeparatorLine]{packages/fltpage2} %use the 
%custom modified fltpage package
\synctex=1 % turn synctex on automatically to sync between pdf viewer [andy]

\RequirePackage[palatino]{quotchap} % for quotes at top of chapters
\newcommand{\HeaderQuote}[2]{ 
    \begin{savequote}[75mm] #1 \qauthor{#2} \end{savequote}
}

\RequirePackage{lettrine} % big letter at start of chapter
\newcommand{\FirstSentence}[2]{ % match chapter color
    \lettrine[lines=2,slope=4pt,nindent=0pt,findent=0pt]{\textcolor{chaptergrey}{#1}}{#2}}

\RequirePackage[tight,nice]{units}

\RequirePackage[
    b5paper,layout=b5paper,
    margin=2.3cm,
%    showframe, % option good for draft mode
    includehead]{geometry} % 
    
\addtolength{\textwidth}{1cm}
\addtolength{\marginparwidth}{-1cm}
\addtolength{\oddsidemargin}{-0.5cm}
\addtolength{\evensidemargin}{-0.5cm}
   
\RequirePackage[b5]{crop}
\topskip0pt % make text appear at top of page, othewise vertically centered

% for comments and such 
\usepackage[colorinlistoftodos, textwidth=\marginparwidth]{todonotes} 

% Colors
\RequirePackage{color} 
% official color definitions at the University of Iceland:
\definecolor{blue}{RGB}{0, 69, 124}
\definecolor{gray}{RGB}{90,90,90} % should be 90,91,94
\definecolor{bluegreen}{RGB}{0,152,170}
\definecolor{red}{RGB}{172,26,64}
\definecolor{green}{RGB}{113,149,0}
\definecolor{yellow}{RGB}{245,207,71}
\definecolor{orange}{RGB}{235, 113, 37}
\makeatletter
\definecolor{chaptergrey}{RGB}{90,90,90} 
% gray color for the chapter numbers and other fancy headings
\makeatother

% colors styles for ColorBrewer Set1 - to match ggplot2
\definecolor{set1red}{RGB}{228, 26, 28} %1 #E41A1C
\definecolor{set1blue}{RGB}{55, 126, 184} %2 #377EB8
\definecolor{set1green}{RGB}{77, 175, 74} %3 #4DAF4A
\definecolor{set1purple}{RGB}{152, 78, 163} %4 #984EA3
\definecolor{set1orange}{RGB}{255, 127, 0} %5 #FF7F00
\definecolor{set1yellow}{RGB}{255, 255, 51} %6 #FFFF33
\definecolor{set1brown}{RGB}{166, 86, 40} %7 #A65628
\definecolor{set1pink}{RGB}{247, 129, 191} %8 #F781BF
% spacing 
\RequirePackage{setspace} 
%\onehalfspacing
\singlespacing
\setstretch{1.1} % reduce spacing
% intention of a paragraph
\parindent 12pt

%Be more forgiving, and stretch word spacing out more so that words don't run 
%out into the margins..
\emergencystretch=1.5em

% headers and footers
\RequirePackage{fancyhdr} 
\renewcommand{\headrulewidth}{0pt}
\setlength\headheight{14pt}


% ------------------------------------------------------------------------- Font
% use fonttype Arno Pro (a copy is located in subdirectory fonts/) instead of 
%standard LaTeX fonts,
% Note that you may have to install them into your font directory. In a 
%terminal type:
% cp fonts/* /usr/local/share/fonts/.
\RequirePackage{mathspec}
\setmathsfont(Digits,Latin,Greek)[Numbers={OldStyle,Proportional}]{Arno Pro}
\setmathrm{Arno Pro}

\RequirePackage{fontspec,xltxtra,xunicode}
\defaultfontfeatures{Mapping=tex-text, Numbers=OldStyle}
%\setromanfont[Mapping=tex-text, 
%			  Numbers=OldStyle, 
%			  Ligatures={Common}, 
%			  SizeFeatures={%
%		          {Size={-10}, Font=* Caption},
%		          {Size={10-13.0}, Font=*},
%		          {Size={13.01-19.9}, Font=* Subhead, Ligatures=Rare, 
%Contextuals={Swash,Alternate}},
%		       {Size={19.91-},Font=* Display, Ligatures=Rare, 
%Contextuals={Swash,Alternate}}}]
%			  {Arno Pro} %
\setromanfont[Mapping=tex-text, Numbers=OldStyle, Ligatures={Common}]{Arno Pro}
%Set fonts for Mac Specific (Comment out on Windows XP)
%\setsansfont[Scale=MatchLowercase,Mapping=tex-text]{Helvetica Neue} 
%\setmonofont[Scale=MatchLowercase]{Consolas}

% gæti breytt leturgerðinni á myndum/töflum með því að taka út 'sf' hér fyrir 
%neðan
\RequirePackage[labelfont={sf,bf,small}, textfont={sf,small}, 
justification=RaggedRight, margin=0pt, figurewithin=chapter, 
tablewithin=chapter]{caption} % gæti haft frekar figurewithin=section
%\renewcommand\thesubfigure{\Alph{subfigure}} %just for aesthetics use upper 
%%case for sub figures 
\usepackage[labelfont=bf,list=true]{subcaption}

\captionsetup[table]{position=top}
\captionsetup[subtable]{textfont=sf,aboveskip=3pt,belowskip=9pt}
\captionsetup[figure]{position=bottom}
\captionsetup[subfigure]{textfont=sf}

%http://tex.stackexchange.com/questions/50988/one-caption-in-listoffigures-for-a-continuedfloat
\DeclareCaptionLabelFormat{continued}{#1~#2~(cont.)}
\captionsetup[ContinuedFloat]{labelformat=continued}

\def\MyCaption#1#2#3{\addtocontents{lof}{\protect\contentsline{figure}{\protect\numberline{\thefigure}{\ignorespaces
 #1\relax}}{{\pageref{#2}}--{\pageref{#3}}}{}}}


%http://tex.stackexchange.com/questions/26521/how-to-change-the-spacing-between-figures-tables-and-text
\setlength{\textfloatsep}{10pt plus 1.0pt minus 2.0pt}

%Vertical layout of float pages : 
%http://www.tex.ac.uk/cgi-bin/texfaq2html?label=floatpages+vertposfp
%By default, LaTeX vertically centres the floats on a float page; the present 
%author is not alone in not liking this arrangement. Unfortunately, the control 
%of the positioning is “buried” in LaTeX-internal commands, so some care is 
%needed to change the layout.
\makeatletter
\setlength{\@fptop}{0pt}
\makeatother
%Surprisingly, you may find this setting leaves your floats too high on the 
%page. One can justify a value of 5pt (in place of 0pt) — it’s roughly the 
%difference between \topskip and the height of normal (10pt) text.
%Note that this is a “global” setting (best established in a class file, or at 
%worst in the document preamble); making the change for a single float page is 
%likely (at the least) to be rather tricky.

% ------------------------------------------------------------------- blank page
\newcommand*\blankpage{%
    \newpage
    %\topskip0pt % messes up with new chapters, creates 2 empty pages!
    \vspace*{\fill}
    \centerline{This page is intentionally left blank.}
    \vspace{\fill}
}

% --------------------------------------------------------------some definitions
\makeatletter
\def\printmode#1{\gdef\@printmode{#1}}
\def\monograph#1{\gdef\@monograph{#1}}

\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\advisoraffiliation#1{\gdef\@advisoraffiliation{#1}}
\def\department#1{\gdef\@department{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitycountry#1{\gdef\@universitycountry{#1}}
\def\printer#1{\gdef\@printer{#1}}
\def\ISBN#1{\gdef\@ISBN{#1}}
\def\committeeA#1{\gdef\@committeeA{#1}}
\def\committeeaffiliationA#1{\gdef\@committeeaffiliationA{#1}}
\def\committeeB#1{\gdef\@committeeB{#1}}
\def\committeeaffiliationB#1{\gdef\@committeeaffiliationB{#1}}
\def\opponentA#1{\gdef\@opponentA{#1}}
\def\opponentaffiliationA#1{\gdef\@opponentaffiliationA{#1}}
\def\opponentB#1{\gdef\@opponentB{#1}}
\def\opponentaffiliationB#1{\gdef\@opponentaffiliationB{#1}}
\makeatother

% ----------------------------------------------------------------- front matter
\usepackage{nomencl}
\makeatletter
\newcommand{\printFrontMatter}[1]{
    \input{frontmatter/coverpage}
    
    \ifthenelse{\equal{\@printmode}{draft}}{
        \pagenumbering{roman}
        \listoftodos
        \strictpagecheck
        \checkoddpage
        \ifoddpage
            % do nothing
        \else
            \blankpage
        \fi        
        \setcounter{page}{0}
        \listofpublications
    }{
        \maketitle
        \copyrightpage
        \dedicationpage{#1}
        
        \HeaderQuote{Either the well was very deep, or she fell very slowly, 
        for she had plenty of time as she went down to look about her and to 
        wonder what was going to happen next.}{Narrator}
        \abstractpage % both in English and Icelandic
        
        \HeaderQuote{I think I should understand that better, if I had it 
        written down: but I can't quite follow it as you say it.}{Alice}
        \tableofcontents
                
        \clearpage % ensure page refernce in TOC
        \HeaderQuote{What is the use of a book, without pictures or 
        conversations?}{Alice}        
        \addcontentsline{toc}{chapter}{\listfigurename}
        \listoffigures
                        
        \clearpage % ensure page refernce in TOC
        \HeaderQuote{Always speak the truth, think before you speak, and write 
        it down afterwards.}{The Queen}
        \addcontentsline{toc}{chapter}{\listtablename}
        \listoftables

        \clearpage % ensure page refernce in TOC
        \HeaderQuote{Well, I never heard it before, but it sounds uncommon 
            nonsense.}{The Mock Turtle}
        \addcontentsline{toc}{chapter}{\listalgorithmname}
        \listofalgorithms
                        
        \clearpage % ensure page refernce in TOC                        
        \HeaderQuote{Sometimes I've believed as many as six impossible things 
            before breakfast.}{The Queen}
        \addcontentsline{toc}{chapter}{\listpublicationname}
        \listofpublications

        \clearpage % ensure page refernce in TOC                
        \HeaderQuote{That's nothing to what I could say if I chose. }{The 
        Duchess}
        \include{scripts/nomencl}
        \addcontentsline{toc}{chapter}{Nomenclature}
        \begin{spacing}{0.9}
        \printnomenclature  
        \end{spacing}
        
        \HeaderQuote{We're all mad here.}{The Cat}
        \acknowledgments
    }
}
\makeatother

% -------------------------------------------------------------------- maketitle
\makeatletter
\renewcommand{\maketitle}{ 
    \bookcover
    \pagestyle{plain}
    \pagenumbering{roman}
    \thispagestyle{empty}
    \begin{center}
        \normalsize Dissertation for the degree of \@degree
        \vspace*{\fill}\\
        \includegraphics[width=24.76mm]{frontmatter/HI-logo.pdf}
        \vspace{12pt}\\
        \Huge \textcolor{chaptergrey}{\sc{\@title}}
        \vspace{24pt}\\
        \Large \@author
        \vspace*{\fill}\\
        \normalsize
        \@department\\
        \@faculty\\
        \@universitycity, \@degreemonth\ \@degreeyear
    \end{center} 
    
    \newpage 
    \lhead{} \rhead{} \cfoot{\thepage}
}
\newcommand{\BackgroundPic}
{%
    \put(0,0){%
        \hspace*{-25pt}
        \begin{tikzpicture}[overlay]
        \node[anchor=south west] (image) at (0,0,0) 
        {\includegraphics[width=2\paperwidth,height=\paperheight,
            keepaspectratio]{frontmatter/HI-blueribbon.pdf}};
        \begin{scope}[x={(image.south east)},y={(image.north west)}]
        \node[font=\bfseries\sffamily\Large,align=center,
            text width=500pt,text=white] (c) at (0.5,0.1) {
            \@faculty\\
            \@university\\
            \@degreeyear
        };
        \end{scope}
        \end{tikzpicture}
    }
}

\newcommand{\bookcover}{ 
    \pagestyle{empty}
    \vspace*{3.35mm}
    {\centering\includegraphics[width=24.76mm]{frontmatter/HI-logo.pdf}\par}
    \vspace*{25.25mm}
    {\centering\bfseries\sffamily\Huge{\@title}\par}
    \vspace*{30mm}
    {\centering\sffamily\Large{\@author}\par}
    \vspace*{\fill}
    \AddToShipoutPicture*{\BackgroundPic}
    %\includepdf[height=\paperheight]{frontmatter/HI-blueribbon.pdf}   
    \newpage 
    \cleardoublepage
    \setcounter{page}{1}
}
\makeatother

% --------------------------------------------------------------- copyright page
% You might also consider licensing your work under Creative Commons (NOTE: 
%this is non-traditional, but a good idea). See: 
%http://creativecommons.org/weblog/entry/12824 for other PhD students who 
%release their work under creative commons.
\makeatletter
\newcommand{\copyrightpage}{
    \newpage \thispagestyle{empty} 
    \noindent A dissertation presented to the \@university\ \@department\ in 
    candidacy for the degree of \@degree.\\ 
    
    \vspace*{\fill}
    
    \noindent {\bf Doctoral committee} \\
    \noindent \@advisor\\
    \noindent \@advisoraffiliation \\
    \\
    \noindent \@committeeA\\
    \noindent \@committeeaffiliationA \\
    \\
    \noindent \@committeeB\\
    \noindent \@committeeaffiliationB \\
    
    \vspace*{\fill}
    
    \noindent{\bf Opponents} \\
    \noindent \@opponentA\\
    \noindent \@opponentaffiliationA\\
    \\
    \noindent \@opponentB \\
    \noindent \@opponentaffiliationB \\
    
    \vspace*{\fill} 
    
    \noindent \@title \\
    \noindent \copyright\ \@degreeyear\ \@author\\
    \noindent Printed in \@universitycountry\ by \@printer \\
    \noindent ISBN \@ISBN
    \newpage \rm
}
\makeatother

% -------------------------------------------------------------- dedication page
\newcommand{\dedicationpage}[1]{
    \newpage \thispagestyle{empty} \vspace*{\fill}
    \noindent \centerline{\emph{#1}}
    \vspace*{\fill} %\emptypage \newpage \rm
    \cleardoublepage
}

% ---------------------------------------------------------------- abstract page
\newcommand{\abstractpage}{
    \chapter*{Abstract}
    \input{frontmatter/abstract}
    \newpage
    \HeaderQuote{Niður, niður, niður! Ætlaði þetta aldrei að taka enda? Hvað 
    skyldi ég hafa hrapað marga kílómetra?}{Lísa}    
    \chapter*{Ágrip}
    \input{frontmatter/abstract_is}
    \cleardoublepage
}

% ------------------------------------------------------------ table of contents
\RequirePackage[titles]{tocloft}
\setcounter{tocdepth}{2}
\setcounter{lofdepth}{1}
\setcounter{lotdepth}{1}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\setlength{\cftchapnumwidth}{2em}
\cftsetindents{section}{2em}{2.4em}
\cftsetindents{subsection}{4.4em}{3.2em}

%\renewcommand*\cftchapnumwidth{2em} % add margin to fit Roman numerals
%\renewcommand*\cftsecnumwidth{3em}  % from Papers section
% -------------------------------------------------------------- list of figures
\renewcommand\listfigurename{Listing of figures}

\newlength{\largNum}

\newlength{\tocRightMargin} % Marge droite
\setlength{\tocRightMargin}{1.2cm}

\newlength{\tocLeftMarginSecondLineFigure}
\setlength{\tocLeftMarginSecondLineFigure}{2.5em}

\makeatletter
\renewcommand*\l@figure[2]{%
    \settowidth{\largNum}{#2}%
    \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\vskip 1.0em \@plus\p@
    \setlength\@tempdima{6.5em}%
    \noindent
    \begingroup
    \def\numberline##1{\makebox[\tocLeftMarginSecondLineFigure][l]{\ ##1}}%
    \pretolerance=10000
    \parindent \z@ \rightskip \tocRightMargin
    \parfillskip -\tocRightMargin
    \leavevmode \normalsize
    \advance\leftskip \tocLeftMarginSecondLineFigure
    \hskip -\leftskip
    #1\nobreak
    \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hskip 1\tocRightMargin plus 1fil\nobreak
    \hb@xt@\largNum{\hss #2}\par
    \penalty\@highpenalty
    \endgroup
    \fi}

\makeatother

% --------------------------------------------------------------- list of tables
\renewcommand\listtablename{Listing of tables}

% ----------------------------------------------------------- list of algorithms
\usepackage{algorithm}
\usepackage{algpseudocode}
\makeatletter
\def\BState{\State\hskip-\ALG@thistlm}
\makeatother
\algnewcommand\algorithmicto{~\textbf{to}~}
\algnewcommand\algorithmicand{~\textbf{and}~}
\algrenewtext{For}[3]%
{\algorithmicfor\ $#1 \gets #2 \text{\algorithmicto} #3$~\algorithmicdo}

\renewcommand{\listalgorithmname}{Listing of algorithms}

% --------------------------------------------------------- list of publications
\newcommand\listpublicationname{Listing of publications}
\newcommand*\listofpublications{ %
    \chapter*{\listpublicationname}    
    \input{frontmatter/papers}
}

% ---------------------------------------------------------------ackowledgements
\makeatletter
\newcommand{\acknowledgments}{
    \chapter*{Acknowledgements}
    \noindent
    \input{frontmatter/thanks}
    \begin{flushright}
        \vfill
        \@universitycity, \@degreemonth\ \@degreeyear\\ 
        \@author
    \end{flushright}
    \vspace*{\fill} 
    \cleardoublepage
}
\makeatother

% ---------------------------------------------------------- the list of authors
\newcommand{\authorlist}{
    \newpage
    \thispagestyle{plain} 
    \chapter*{Author List}
    \noindent \input{frontmatter/authorlist}
    \newpage \rm
}

\makeatletter
\renewcommand\part{%
    \if@openright
    \cleardoublepage
    \else
    \cleardoublepage
    \fi
    \thispagestyle{empty}% remove page numbering
    \if@twocolumn
    \onecolumn
    \@tempswatrue
    \else
    \@tempswafalse
    \fi
    \null\vfil
    \secdef\@part\@spart}
\@addtoreset{chapter}{part}
\@addtoreset{@ppsaveapp}{part}
\makeatother

%-------------------------------------------------------- main matter / prologue
\makeatletter
\newcommand*\prologue{%
    % setting up for the mainmatter
    \cleardoublepage
    \setcounter{page}{1}
    \pagenumbering{arabic}
    \ifthenelse{\equal{\@monograph}{true}}{\part{Monograph}}{\part{Prologue}}
    \label{Prologue}
    \normalsize
    \ifthenelse{\equal{\@printmode}{draft}}{
        \lfoot{Draft -- \today}
    }{}    
    \newpage
    \blankpage        
    \pagestyle{fancy} % options: empty , plain , fancy
    \lhead[\fancyplain{}{}]{\fancyplain{}{\rightmark}}
    \rhead[\fancyplain{}{\leftmark}]{\fancyplain{}{}}
    \cfoot{\fancyplain{}{\thepage}}
}
\makeatother

% ------------------------------------------------------------------- references
\newenvironment{references}{
    \newcommand{\topic}[2]{ ##1 }
        \bibliographystyle{abbrvnat} 
        \addcontentsline{toc}{chapter}{\bibname}
        \begin{spacing}{0.75}
        }
        {
        \end{spacing}
}
\renewcommand\bibname{References}
\RequirePackage[comma, sort&compress]{natbib}
%   list an entire bibliography entry inline. Useful for acknowledging when my 
%paper was previously published
\RequirePackage{bibentry} 
\nobibliography*

% --------------------------------------------------------------- my papers page
\newcommand*\papers{%
    \part{Papers}\label{Papers}
    \renewcommand\appendixname{Paper}
    \renewcommand\chaptername{Paper}
    \renewcommand{\thechapter}{\Roman{chapter}}
    \pagestyle{plain}
    
    \strictpagecheck
    \checkoddpage
    \ifoddpage
    % do nothing
    \else
    \newpage
    \blankpage    
    
    \include{endmatter/papers} 
}

\usepackage{pgfkeys}
\makeatletter
\pgfkeys{/papers/entities/.cd,
    authorslist/.initial=\@author,
    affiliationlist/.initial={\@department, \@university, \@universitycountry},
    remark/.initial=NA,
    status/.initial=published,
    natbib/.initial=NA,
    file/.initial=NA,
}

\usepackage{keyval}
\usepackage{packages/usebib}
\newbibfield{title}
\newbibfield{author}
\newbibfield{booktitle}
\newbibfield{doi}
\newbibfield{url}
\newbibfield{month}
\newbibfield{year}
\newbibfield{publisher}

\def\papers@set@keys#1{%%
    \pgfkeys{/papers/entities/.cd,#1}}
\def\papers@get#1{%%
    \pgfkeysvalueof{/papers/entities/#1}}
\newcommand\paper[1]{%%
    \thumbindex{\value{chapter}}{\Roman{chapter}}
    \bgroup
    \papers@set@keys{#1}
    
    {
        \normalsize
        \raggedright
        \papers@get{authorslist}
    }
    {\par\vskip0.5\baselineskip\hrule\vskip0.5\baselineskip}
    %
    {
        \scriptsize
        \raggedright
        \papers@get{affiliationlist}
    }
    {\par\vskip4ex}
    %
    {
        \begin{spacing}{0.8}
            \noindent
            \raggedright
            \small
            \usebibentry{\papers@get{natbib}}{booktitle}
            \ifthenelse{\equal{\papers@get{remark}}{NA}}{}{
            -- \papers@get{remark}}
            \newline
            
            \ifthenelse{\equal{\papers@get{status}}{Submitted}}{
            \noindent Manuscript: 
            \url{\usebibentry{\papers@get{natbib}}{url}}
            }{
            \noindent doi: 
            \href{http://dx.doi.org/\usebibentry{\papers@get{natbib}}{doi}}{\usebibentry{\papers@get{natbib}}{doi}}
            }
        \end{spacing}
    }
    {\par\vskip4ex}
    %
    \vfill
    %
    \small    
    \ifthenelse{\equal{\papers@get{status}}{published}}{
    \ifthenelse{\equal{\@monograph}{true}}{ 
    \noindent Published in}{
    \noindent Reprinted, with permission, from}
    }{
    \noindent \papers@get{status} to}        
    \emph{\usebibentry{\papers@get{natbib}}{booktitle}} 
    (\usebibentry{\papers@get{natbib}}{year}).
    \ifthenelse{\equal{\papers@get{status}}{Submitted}}{}{
    Copyright \usebibentry{\papers@get{natbib}}{year} 
    by \usebibentry{\papers@get{natbib}}{publisher}.}%
    %
    \newpage
    \ifthenelse{\equal{\@printmode}{draft}}{ % do nothing
    }{\ifthenelse{\equal{\@monograph}{true}}{  % do nothing    
    }{
        \includepdf[page=1, % first page
        width=\textwidth, % full text-width
        pagecommand={\thispagestyle{empty} % continue page numbering
            \thumbindex{\value{chapter}}{\Roman{chapter}} % paper ID
        } 
        ]{\papers@get{file}}
    
        \includepdf[pages={2-}, % all pages after
        width=\textwidth, % full text-width
        pagecommand={\thispagestyle{plain} % continue page numbering
            \thumbindex{\value{chapter}}{\Roman{chapter}} % paper ID
        } 
        ]{\papers@get{file}}
    }}
    \strictpagecheck
    \checkoddpage
    \ifoddpage
        % do nothing
    \else
    \newpage
    \blankpage
    \thumbindex{\value{chapter}}{\Roman{chapter}}
    \fi
    \egroup
}
\makeatother

%******** Thumb-index ************
\usepackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{calc,arrows,shapes} % 'arrows,shapes' to use in a schematic fig

\newlength{\thumbwidth}
\setlength{\thumbwidth}{1.2cm}

\newlength{\thumbheight}
\setlength{\thumbheight}{1.5cm}

\tikzset{
    thumb/.append style={
        fill=black,
        text=white,
        minimum height=\thumbheight,
        text width=\thumbwidth,
        outer sep=0pt,
        execute at begin node=\sffamily\bfseries\Huge,
    }
}
\newcommand{\thumbindex}[2] {
    \strictpagecheck
    \checkoddpage
    \ifoddpage
    
    \begin{tikzpicture}[remember picture, overlay]
    \node [thumb,align=center,anchor=north east] at ($%
    (current page.north east)-%
    (0,{1cm+(#1-1)*\thumbheight})%
    $) {#2};
    \end{tikzpicture}
    \else
    \begin{tikzpicture}[remember picture, overlay]
    \node [thumb,align=center,anchor=north west] at ($%
    (current page.north west)-%
    (0,{1cm+(#1-1)*\thumbheight})%
    $) {#2};
    \end{tikzpicture}
    \fi
    
}

% --------------------------------------------------------------------- colophon
\newcommand*\colophon{
    \strictpagecheck
    \checkoddpage
    \ifoddpage
    % nothing done
    \else
    \cleardoublepage
    \newpage % odd page
    \fi
    %\pagestyle{empty}
    \thispagestyle{empty}
    \begin{center}
        \IfFileExists{figures/alice-cheshire.eps}{ %true-branch
            \begin{tikzpicture}
            \node[anchor=south west] (image) at (0,0,0) 
            {\includegraphics[width=0.9\textwidth]{alice-cheshire}};
            \begin{scope}[x={(image.south east)},y={(image.north west)}]
            %% next four lines will help you to locate the point needed by 
            %%forming a 
            %%grid. comment these four lines in the final picture.↓
            %\draw[help lines,xstep=.1,ystep=.1] (0,0) grid (1,1);
            %\draw[help lines,xstep=.05,ystep=.05] (0,0) grid (1,1);
            %\foreach \x in {0,1,...,9} { \node [anchor=north] at (\x/10,0) 
            %{0.\x}; }
            %\foreach \y in {0,1,...,9} { \node [anchor=east] at (0,\y/10) 
            %{0.\y};}
            %% upto here↑
            \node[text width=180pt] (c) at (0.72,0.28) {
                {\Huge \hfill Colophon}
                \small
                \include{endmatter/colophon}
            };
            \end{scope}
            \end{tikzpicture}
        }{ %false-branch
        {\Huge \hfill Colophon}
        \vspace*{18pt} 
        \parbox{200pt}{\raggedright \include{endmatter/colophon}}
    }
\end{center}
}