%------------------------------------------------------------------------------
% Definition
%------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cheatsheet}[2026/01/09 v1.0 LaTeX Cheatsheet Template]

% Inherit options of extarticle
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{extarticle}
}
\ProcessOptions\relax
\LoadClass{extarticle}

%------------------------------------------------------------------------------
% Packages
%------------------------------------------------------------------------------
% Layout
\RequirePackage{geometry}
% Header and footer
\RequirePackage{fancyhdr}
% Graphic
\RequirePackage{tikz}
% Fonts
\RequirePackage[sfdefault]{roboto}
% Multiple columns
\RequirePackage{multicol}
% Code
\RequirePackage{listings}
% Hyperlink
\RequirePackage{hyperref}
% Paragraph
\RequirePackage{parskip}

%------------------------------------------------------------------------------
% Colors
%------------------------------------------------------------------------------
% Primary colors - can be redefined by users
\definecolor{primary}{RGB}{54,57,63}
\definecolor{background}{RGB}{250,252,253}
\definecolor{border}{RGB}{214,213,218}

% Legacy color names for backward compatibility
\colorlet{innoinnored}{primary}
\colorlet{innoinnobggray}{background}
\colorlet{innoinnofggray}{border}

%------------------------------------------------------------------------------
% Commands
%------------------------------------------------------------------------------
\newcommand*{\cheatsheettitle}[1]{\def\@cheatsheettitle{#1}}

% Main section command
\newcommand*{\cheatsheetsection}[1]{
  \noindent
  \begin{tikzpicture}
    \node[
      fill=primary,
      text=white,
      font=\large\bfseries,
      inner xsep=3mm,
      inner ysep=2mm,
      text width=\columnwidth-6mm,
      anchor=north west
    ] {#1};
  \end{tikzpicture}
  \vspace{-4mm}
}

% Subsection command
\newcommand*{\cheatsheetsubsection}[1]{
  \noindent
  \begin{tikzpicture}
    \node[
      fill=border,
      text=primary,
      font=\normalsize\bfseries,
      inner xsep=2.5mm,
      inner ysep=1.5mm,
      text width=\columnwidth-5mm,
      anchor=north west
    ] {#1};
  \end{tikzpicture}
  \vspace{-4mm}
}

\newcommand*{\cheatsheetfooter}[2]{
  \small\textit{#1\newline\url{#2}}
}

%------------------------------------------------------------------------------
% Page layout
%------------------------------------------------------------------------------
% Page margins
\geometry{a4paper, landscape, left=7mm, right=7mm, bottom=10mm, top=22mm}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer
\fancyhf{}
\pagestyle{fancy}

\usetikzlibrary{calc}
\fancyhead[C]{
  \begin{tikzpicture}[overlay, remember picture]
    \fill[primary] (current page.north west) rectangle ($(current page.north east)+(0,-14mm)$);
    \node[anchor=north west, text=white, font=\Huge, minimum size=15mm, inner xsep=6mm] at (current page.north west) {\@cheatsheettitle};
  \end{tikzpicture}
}

%------------------------------------------------------------------------------
% Text
%------------------------------------------------------------------------------
% Paragraph indentation
\setlength{\parindent}{0pt}
% Paragraph
\setlength{\parskip}{0.75\baselineskip plus 2pt}
% Item indentation
\setlength\itemindent{25pt}

%------------------------------------------------------------------------------
% Multicolumns
%------------------------------------------------------------------------------
\setlength{\columnseprule}{.05mm}
\setlength{\columnsep}{1cm}
\def\columnseprulecolor{\color{border}}

%------------------------------------------------------------------------------
% Hyperlink
%------------------------------------------------------------------------------
\hypersetup{
  colorlinks=true,
  linkcolor=primary,
  urlcolor=primary,
}
\urlstyle{same}

%------------------------------------------------------------------------------
% Code
%------------------------------------------------------------------------------
\lstset{
  belowcaptionskip=1\baselineskip,
  frame=single,
  xleftmargin=2mm,
  xrightmargin=2mm,
  backgroundcolor=\color{background},
  rulecolor=\color{border},
  basicstyle=\footnotesize\ttfamily,
  framesep=2mm,
  aboveskip=5mm,
  belowskip=0mm,
}
