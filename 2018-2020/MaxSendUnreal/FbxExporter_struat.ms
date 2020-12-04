--## coding=UTF-8
struct Python_ExportFBX_struct
(
    ExportType = 2, -- 1 动画 2
    is_selectedOnly = 1 ,
    fbxfile ="",
    INIDataPath = (getDir #Scripts) + @"\MaxSendUnreal\MAX_to_Unreal_Tool.ini",
    game_path = "None" ,
    game_anim_path ="None" ,
    game_skeleton_path = "None",
    fbxtemp_path = (pathConfig.getProjectSubDirectory 3),
    fn get_unrealpath =
    (
        if doesFileExist this.INIDataPath do (
            this.game_path = getINISetting this.INIDataPath "unreal_path" "game_path"
            this.game_anim_path = getINISetting this.INIDataPath "unreal_path" "game_anim_path"
            this.game_skeleton_path = getINISetting this.INIDataPath "unreal_path" "game_skeleton_path"
            this.fbxtemp_path = getINISetting this.INIDataPath "unreal_path" "fbxtemp_path"

        )
    ),
    fn set_unrealpath = 
    (
        setINISetting this.INIDataPath "unreal_path" "game_path" this.game_path
        setINISetting this.INIDataPath "unreal_path" "game_anim_path" this.game_anim_path
        setINISetting this.INIDataPath "unreal_path" "game_skeleton_path" this.game_skeleton_path
        setINISetting this.INIDataPath "unreal_path" "fbxtemp_path" this.fbxtemp_path
    ), 
    fn export_mod =
    (
        --模型
        if this.ExportType == 2 then
        (
            FbxExporterSetParam "ResetExport" ;
            FbxExporterSetParam "SmoothingGroups" true ;
            FbxExporterSetParam "SmoothMeshExport" true
            FbxExporterSetParam "Animation"  false;
            FbxExporterSetParam "EmbedTextures" false
        )
        --动画
        else
        (
            FbxExporterSetParam "ResetExport"
            FbxExporterSetParam "Animation"  true;
            FbxExporterSetParam "BakeAnimation"  true
            FbxExporterSetParam "BakeResampleAnimation"  true
            FbxExporterSetParam "FilterKeyReducer"  true ;
            FbxExporterSetParam "EmbedTextures" false
        )
    ),
    fn get_fbxname_form_MAXfile =
    (
        if maxfilename != "" then
        (
            TempName = getFilenameFile maxfilename
            fn_fbxName = (filterString TempName "-")[1] + ".FBX"
            /*
            if this.ExportType == 1 do
            (
                fn_fbxName = "s_" + fn_fbxName
            )*/
            return fn_fbxName
        )
        else (return "")
    ),
    fn test_export =
    (
        this.export_mod()
        project_folder_export = this.fbxtemp_path + "\\"
        if not doesFileExist project_folder_export do 
        (
            makeDir project_folder_export
        )
        this.fbxfile = project_folder_export + this.get_fbxname_form_MAXfile()
        if this.is_selectedOnly == 1 then (
            exportFile this.fbxfile #noPrompt selectedOnly:true using:#FBXEXP
        )else(
            exportFile this.fbxfile #noPrompt selectedOnly:false using:#FBXEXP
        )
        return this.fbxfile
    ),
    fn check_export_is_ok =
    (
        if maxfilename != "" then
        (
            return 1
        )else(
            return 0
        )
    ),
    -- Struct body.
    on create do
    (
        this.get_unrealpath()
    )
)
Python_ExportFBX_struct_int = Python_ExportFBX_struct()
ok
--Python_ExportFBX_struct_int.test_export()
--Python_ExportFBX_struct_int.get_unrealpath()