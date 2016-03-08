The following works on laptop to create the .zip file, but the .zip file structure is crap.

C:\windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe C:\Users\ddalrymp.ORADEV\Source\Repos\WebApplication1\WebApplication1\build.xml /p:VisualStudioVersion=14.0 /p:Configuration=Debug;SolutionName=WebApplication1;ProjectName=WebApplication1

Trying the following on desktop ( WORKS ):

C:\windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe C:\Users\ddalrymp\Documents\GitHub\WebApplication1\WebApplication1\build.xml /p:VisualStudioVersion=10.0 /p:Configuration=Debug;SolutionName=WebApplication1;ProjectName=WebApplication1

NuGet failures, look here: https://docs.nuget.org/consume/package-restore/msbuild-integrated ( MODIFY )

There is also a deploy.cmd file in the output directory. Need to review what that does.