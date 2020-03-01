package com.sjx.hangduo.service.law.impl;

import com.sjx.hangduo.dao.law.DirectoryMapper;
import com.sjx.hangduo.model.entity.Directory;
import com.sjx.hangduo.model.vo.DirRegVO;
import com.sjx.hangduo.service.law.DirectoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.law.impl
 * @Description:
 * @date 2020 年 02 月 15 19:45 星期六
 */
@Service
public class DirectoryServiceImpl implements DirectoryService {

    @Resource
    private DirectoryMapper directoryMapper;

    @Override
    public List<Directory> queryDirectoryByParentId(Integer parentId, Integer lawId) {
        return directoryMapper.selectDirectoryByParentId(parentId, lawId);
    }

    @Override
    public boolean removeDirById(Integer id) {
        Integer integer = directoryMapper.deleteDirByID(id);
        if (integer > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public DirRegVO queryDirById(Integer id) {
        return directoryMapper.selectDirById(id);
    }

    @Override
    public List<Directory> queryAllDir() {
        return directoryMapper.selectAllDir();
    }

    @Override
    public List<Directory> queryDirByRegId(Integer regId) {
        return directoryMapper.selectDirByRegId(regId);
    }

    @Override
    public boolean addDir(Directory directory) {
        if (directory.getDirectoryId() != null) {
            Integer integer = directoryMapper.updateDir(directory);
            if (integer > 0) {
                return true;
            }
        } else {
            Integer integer = directoryMapper.insertDir(directory);
            if (integer > 0) {
                return true;
            }
        }
        return false;
    }
}
