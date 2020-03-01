package com.sjx.hangduo.dao.law;

import com.sjx.hangduo.model.entity.Directory;
import com.sjx.hangduo.model.vo.DirRegVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.dao.law
 * @Description: 目录mapper接口
 * @date 2020 年 02 月 15 19:27 星期六
 */
@Mapper
public interface DirectoryMapper {
    List<Directory> selectDirectoryByParentId(@Param(value = "parentId")Integer parentId, @Param(value = "lawId")Integer lawId);
    Integer deleteDirByID(@Param(value = "id")Integer id);
    DirRegVO selectDirById(@Param(value = "id")Integer id);
    List<Directory> selectAllDir();
    List<Directory> selectDirByRegId(@Param(value = "regId")Integer regId);
    Integer insertDir(@Param("dir")Directory directory);
    Integer updateDir(@Param("newDir")Directory directory);
}
