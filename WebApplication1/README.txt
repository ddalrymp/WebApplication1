The following works on laptop to create the .zip file, but the .zip file structure is crap.

C:\windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe C:\Users\ddalrymp.ORADEV\Source\Repos\WebApplication1\WebApplication1\build.xml /p:VisualStudioVersion=14.0 /p:Configuration=Debug;SolutionName=WebApplication1;ProjectName=WebApplication1

-------------------------------------------------------------------------------------------------------------------------------------------------
BUILD the application after Git Sync on Desktop ( WORKS ):

C:\windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe C:\Users\ddalrymp\Documents\GitHub\WebApplication1\WebApplication1\build.xml /p:VisualStudioVersion=10.0 /p:Configuration=Debug;SolutionName=WebApplication1;ProjectName=WebApplication1

NuGet failures, followed the instructions here (https://docs.nuget.org/consume/package-restore/migrating-to-automatic-package-restore) to remove the elements in the .csproj xml.

-------------------------------------------------------------------------------------------------------------------------------------------------
DEPLOY to IIS on Desktop (WIP):