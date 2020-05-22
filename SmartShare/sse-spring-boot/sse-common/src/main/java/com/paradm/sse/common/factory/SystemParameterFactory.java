package com.paradm.sse.common.factory;

import com.paradm.sse.common.constant.GlobalConstant;
import com.paradm.sse.common.utils.Utility;

import java.util.*;

/**
 * @author Jacky.shen
 * @create data 2020/5/22
 */
public class SystemParameterFactory {

  private static boolean loadStatus = false;
  private static Map<String, String> hashSysParam = new Hashtable<>();

  public static boolean isLoad() {
    return loadStatus;
  }

  public static void init(Map<String, String> hashIn) {
    hashSysParam.putAll(hashIn);
    loadStatus = true;
  }

  /**
   * Get the system parameter as a String.
   *
   * @param key The parameter code.
   * @return The parameter value. Returns null if the input parameter is not a key to the system parameter.
   */
  public static String getSystemParameter(String key) {
    if (Utility.isEmpty(hashSysParam)) {
      return "";
    }
    return (hashSysParam.get(key));
  }

  /**
   * Get the system parameter as an Integer
   *
   * @param key The parameter code.
   * @return The parameter value in integer. Returns Integer.MIN_VALUE if the input parameter is not a key to the system parameter.
   */
  public static Integer getSystemParameterInteger(String key) {
    if (Utility.isEmpty(hashSysParam)) {
      return Integer.MIN_VALUE;
    }
    return (Utility.parseInteger(hashSysParam.get(key)));
  }

  /**
   * Get the system parameter as a boolean.
   *
   * @param key The parameter code.
   * @return true if this value is non-zero (or true if already a BooleanValue); false otherwise.
   */
  public static boolean getSystemParameterBoolean(String key) {
    if (Utility.isEmpty(hashSysParam)) {
      return false;
    }
    return (Utility.parseBoolean(hashSysParam.get(key)));
  }

  /**
   * Get the system parameters and return in a <code>List</code>.
   *
   * @param key The parameter code. Each parameter is separated by a comma.
   * @return The parameter value in a <code>List</code>. Returns null if the input parameter is not a key to the system parameter.
   */
  public static List<String> getSystemParameterList(String key) {
    List<String> result = new ArrayList<>();
    if (Utility.isEmpty(hashSysParam)) {
      return result;
    }
    String valueStr = hashSysParam.get(key);
    if (Utility.isEmpty(valueStr)) {
      return result;
    }
    StringTokenizer st = new StringTokenizer(valueStr, GlobalConstant.Symbol.COMMA.toString());
    while (st.hasMoreTokens()) {
      String token = st.nextToken();
      if (token.length() > 0) {
        result.add(token);
      }
    }
    return result;
  }

  /**
   * Get the system parameter as a <code>Enum</code>.
   *
   * @param key The parameter code.
   * @param enumType
   * @return The parameter value in a <code>Enum</code>.
   */
  public static <T extends Enum<T>> T getSystemParameterEnum(String key, Class<T> enumType) {
    String enumStr = getSystemParameter(key);
    if (Utility.isEmpty(enumStr)) {
      return null;
    }
    return Enum.valueOf(enumType, enumStr);
  }

  public static void setSystemParameter(String key, String value) {
    if (!Utility.isEmpty(key) && !Utility.isEmpty(value) && !Utility.isEmpty(hashSysParam)) {
      hashSysParam.put(key, value);
    }
  }
}
