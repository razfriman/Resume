\ProvidesClass{resume}
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}
\RequirePackage[quiet]{fontspec}

\usepackage{pstricks}
\usepackage{fontspec}
\usepackage{fontawesome}

\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}

\usepackage{enumitem}
\setlist[itemize]{leftmargin=*}

\RequirePackage[hidelinks]{hyperref}
\hypersetup{
	pdftitle={},
	pdfauthor={},
	pdfsubject={},
	pdfkeywords={},
	colorlinks=false,
	allbordercolors=white
}

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------
\definecolor{black}{RGB}{0,0,0}
\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{grayalt}{HTML}{575757}
\definecolor{profilecolor}{HTML}{C7C7C7}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{maingray}{HTML}{B9B9B9}
\definecolor{darkgray}{HTML}{333333}
\definecolor{lightgray}{HTML}{999999}

\colorlet{fillheader}{white}
\colorlet{header}{gray}
\colorlet{textcolor}{black}
\colorlet{headercolor}{gray}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------
\pagestyle{empty} % Disable headers and footers
\setlength{\parindent}{0pt} % Disable paragraph indentation

% --------------------------------------------------------------------------------------
% 	FONTS
%-------------------------------------------------------------------------------------
\setmainfont
[ 	Path = fonts/,
Extension = .otf,
UprightFont = SF-Pro-Text-Regular,
BoldFont = SF-Pro-Text-Bold,
ItalicFont = SF-Pro-Text-RegularItalic
] {sfprotext}

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

% Sidebar sections
\newcommand{\profilesection}[1]{
	\vspace{8pt}{
		\color{black!80} \Large #1 
	}
}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvgithub}[1]{\renewcommand{\cvgithub}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}

% Command for project languages
\newcommand\projectlanguage[1]{\color{grayalt}{\emph{#1}}}

% Command for projects
\newcommand\project[3]{
\textbf{#1} {\projectlanguage{#2}}
\begin{itemize}
	\item #3
\end{itemize}
}

%----------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{

	\begin{tikzpicture}[remember picture,overlay]
	\node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.0cm){};
	\end{tikzpicture}
	
	\begin{tikzpicture}[remember picture,overlay]
	\node [rectangle, fill=profilecolor, anchor=north, minimum width=9cm,  minimum height=7cm] (box) at (-5cm,0.0cm){};
	\end{tikzpicture}
	
%------------------------------------------------
	
	\begin{textblock}{6}(0.5, 0.2)
		
		%------------------------------------------------
		
		\vspace{4mm}
		{\Huge\cvname}	
		\vspace{2mm}
		
		%------------------------------------------------
		
		\renewcommand{\arraystretch}{2}
		\begin{tabular}{p{1cm} @{\hskip 0.5cm}p{5cm}}

			{$
				\begin{array}{l}
				\hspace{2.8mm} \huge \textnormal{\faPhoneSquare}
				\end{array}
				$} 
			& \cvnumberphone\\
		
			{$
				\begin{array}{l}
				\hspace{2.8mm} \huge \textnormal{{\faShareAltSquare}}
				\end{array}
				$} 
			& \href{http://\cvsite}{\cvsite} \\

			{$
				\begin{array}{l}
				\hspace{2.5mm} \huge \textnormal{{\faEnvelopeSquare}}
				\end{array}
				$} 
			& \href{mailto:\cvmail}{\cvmail} \\
		

			{$
				\begin{array}{l}
				\hspace{3mm} \huge \textnormal{{\faLinkedinSquare}}
				\end{array}
				$} & \href{https://www.linkedin.com\cvlinkedin}{\cvlinkedin} \\


			{$
				\begin{array}{l}
				\hspace{3mm} \huge \textnormal{\faGithubSquare}
				\end{array}
				$} & \href{https://www.github.com/\cvgithub}{\cvgithub} \\
  
			
		\end{tabular}
		
		%------------------------------------------------
		\vspace{4mm}
		\profilesection{Programming Languages}
		
		 \programming
	
		\vspace{4mm}
		\profilesection{Technologies}
		
		\technologies
		
		\vspace{4mm}
		\profilesection{Interests}
		
		\interests
		
		\vspace{4mm}
		\profilesection{Awards}
		
		\awards
		
		\vspace{4mm}
		\profilesection{Languages}
		
		\languages
		
	\end{textblock}
}

\renewcommand{\section}[1]{
	\par\vspace{\parskip}
	{
		\LARGE\color{headercolor} #1
	}
	\par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{
		\Large\heading\color{headercolor} #1
	}
	\par\vspace{.25\parskip}
}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
	}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[6]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#3}% 
		\hfill%
		{#4}%
	}\\%
	#2&\parbox[t]{0.83\textwidth}{%
		\ifblank{#5}{}{#5 \\}
		#6%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=-1cm,right=1cm,bottom=0cm,nohead,nofoot]{geometry}