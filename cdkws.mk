.PHONY: clean All Project_Title Project_Build Project_PostBuild

All: Project_Title Project_Build Project_PostBuild

Project_Title:
	@echo "----------Building project:[ W806_SDK - BuildSet ]----------"

Project_Build:
	@make -r -f W806_SDK.mk -j 6 -C  Project 

Project_PostBuild:
	@echo Executing Post Build commands ...
	@cd "Project" && export CDKPath="D:/C-Sky/CDK" CDK_VERSION="V2.10.3" ProjectPath="D:/PROJECT_SDK/KLJ_SDK_W806/Project/" && D:/PROJECT_SDK/KLJ_SDK_W806/Project/cdk_aft_build.sh;D:/PROJECT_SDK/KLJ_SDK_W806/Project/aft_build_project.sh 
	@echo Done


clean:
	@echo "----------Cleaning project:[ W806_SDK - BuildSet ]----------"

