package com.sjx.hangduo.service.law;

import com.sjx.hangduo.model.entity.Directory;
import com.sjx.hangduo.model.vo.DirRegVO;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.law
 * @Description: 目录操作的service接口
 * @date 2020 年 02 月 15 19:42 星期六
 */
public interface DirectoryService {
    List<Directory> queryDirectoryByParentId(Integer parentId, Integer lawId);
    boolean removeDirById(Integer id);
    DirRegVO queryDirById(Integer id);
    List<Directory> queryAllDir();
    List<Directory> queryDirByRegId(Integer regId);
    boolean addDir(Directory directory);
}
