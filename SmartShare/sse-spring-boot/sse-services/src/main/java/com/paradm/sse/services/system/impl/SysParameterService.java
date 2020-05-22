package com.paradm.sse.services.system.impl;

import com.paradm.sse.common.enums.RecordStatus;
import com.paradm.sse.common.exception.ApplicationException;
import com.paradm.sse.common.factory.SystemParameterFactory;
import com.paradm.sse.common.utils.Utility;
import com.paradm.sse.domain.system.entity.SysParameter;
import com.paradm.sse.persist.system.SysParameterRepository;
import com.paradm.sse.services.framework.impl.BaseServce;
import com.paradm.sse.services.system.ISysParameterService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

/**
 * @author Jacky.shen
 * @create data 2020/5/22
 */
@Slf4j
@Service
public class SysParameterService extends BaseServce implements ISysParameterService {

  @Autowired
  private SysParameterRepository sysParameterRepository;

  @Override
  public Map<String, String> getAllSysParameter() {
    Map<String, String> result = new Hashtable<>();
    try {
      List<SysParameter> list = sysParameterRepository.findByRecordStatus(RecordStatus.ACTIVE);
      if (!Utility.isEmpty(list)) {
        list.forEach(sysParameter -> result.put(sysParameter.getParameterCode(), sysParameter.getParameterValue()));
      }
    } catch (Exception e) {
      log.error(e.getMessage(), e);
    }
    return result;
  }

  @Override
  public void initGlobalSysParameter() {
    try {
      Map<String, String> sysParaHash = this.getAllSysParameter();
      this.initGlobalSysParameter(sysParaHash);
    } catch (Exception e) {
      throw new ApplicationException(e.getMessage());
    }
  }

  @Override
  public void initGlobalSysParameter(Map<String, String> sysParaHash) {
    if (!Utility.isEmpty(sysParaHash)) {
      SystemParameterFactory.init(sysParaHash);
    }
  }
}
