package com.sjx.hangduo.util.alipay;

public class AlipayConfig {

    public static String app_id = "2016101200671577";

    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCDF9X8MNM2SxLMa8IY4njTb0aPd8jte3bpJRzfpM9LWtliJREqYPtWOG0+8ezJiF7e9A274cnFiNH5Sq6oowFUF0XZXBEZOUoRFQEQfj1qU8oC03DLSccl2vgKjdOWSDnoHkYsTaqPQW/tkqc4Y7iLAQekkkti9uh/iiMyO7xhVaTNf1z3BTslpv2klG2D1gAlRswimNTHbMQ7ikipATC3deVxOcEHzWA/5KBZ1jpnBz1twIYDhXfWEyQSmBgD/qDz8CVAEqC6LlTomhXMmzz9i4w0a7VQXgs8E3/mSWNi2ZO1+ZjY85XWttG/h0lkDf1/nKDwCYIHswuDbQv2sEbVAgMBAAECggEAFHcJIdihcG1h3uXHpEjeoetSMZ16kZBfrN/tVQCOl+3z171/o4UGV5xxeY0c8Q1H+jhRWI5UCHFmjitZftwLngwQDHGx/aUS6f3Eb8W1Yr73318Q0buPyloXtNYVPPXDjHgFbm8lfD2z8nudfVEcAx9DCS8Jc8al3xs6iWIH843GqldO2rmvkikYgMZ4EJgmj65Qc1ORdQcHdVdRuJA1WKF2ZBwYkThJWDiLrY26sD+LIdQa4M7e62wesvQAxLMkVXBzGm74IT8pU3sG6ZQMBR8luNjKw8TtNRyr6bYF4WYWrH70FGLMA1uLM9nLCUaI4QIfhZwwolf2MBvHqSJqNQKBgQDzXfKlULIReivSxpy8Se5JYcwoLsAW75PO7FPTNUePkCehRcKiGnDhP8Q66yfKlSYORvTkQwHFP+3CRLyr1N+vchU3XpZkGzxV8jEdD9tJ7+wYMokFIC3MmUcGJO9rYY45EYRj6TbVr3PUZZyN6ZlVOsMid5dBnXlgPXd1+micOwKBgQCJ5eeEbcliX59ux6x0hXDuPdb34qGMaOmvkFm8/ixuw2XPumddcwHnARSDZ/2Gdx56git5MYuJSvqdzhb7XgoS/0VVjMJPLooKTnQfIYOudrYG4vhxKzeAavPidnZUM1bP9LZzIfWj//AtiKISQL2eGK+LPQa527wyCjuNmvFILwKBgQCYpd3zyWjXw4zHWWKoS6sWBiy7K4+7EyzgBqYRfYLUTrQ82PfbG8Cf2JJp7mP4EpNbMzCaGFl88rtcNictlIl1j5Y1M7QbOGYg9pfNxctjVgT9rHz7ZRK1GZNODE7MSNWfgBhNXtPRNortt4p6DQLrTb9l2CNcubyPHB7ZNmb1TwKBgHhwrL0lhna9PerrytwakIAE0vS+pIqWN0R3t2kyNmynjQzZqd4czNSORPRgpzYCZERr3LyFYXIQYsPhdIEnqXTeMBiAUFYIN9i4nQNzqid+1408P/HX5SnsQAbToJX6ISCQg6obRwhuSb/7TlLS6MpklS3vpyg9mym5djo/0e1RAoGAHzCJzpmySysMBE9urvr1QHCu6ZlJ6LwSa+qqKvwM3BxyPrGio3tFoSWfBgiXjp0xtR3+dOkFTl8FP3dSSUNaJFN6bsjQl2j0Cz07EMCsRSdEXg6JTvD0HI8JvwFYWezdmUxRgz4dD58iny6o0npu+lLbxaZbeSf0xhNiZzF8XCI=";

    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnw/1gERIHDvzfmwVtakL3UzmIwIHvhvLZpw6zGsjy+sqsR8Q2foTOZWiEUmP3XF04sXwPqtwAytpXxRyxIN98IFgZhRUiFIVyIUrktJO4IxqYdYnuzUdLrS9d6RfACvZznG4MMN5yu7GouOyqSx/3QxGh6s3enE0Q65/tNc1F3XHka64SpLg2M5p+C2Bzv7DSrIiNmr7KTS2MmQvsvVZf29kSNxXAVvbMzBfNlN8VHB8ea8yxnickycPTFUcWkfw7/D8j2QB/NBiMamo9x5KYo5v7zdgnnX/DbHXNiTNik9XzlIFLMIZkV21fo2dBwE3s6+lKF4z51ZzYORi0muv5QIDAQAB";

    public static String notify_url = "http://localhost:8080/notify";

    public static String return_url = "http://localhost:8080/callBack";

    public static String sign_type = "RSA2";

    public static String charset = "utf-8";

    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

//	public static String log_path = "C:\\";



//    /**
//     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
//     * @param sWord 要写入日志里的文本内容
//     */
//    public static void logResult(String sWord) {
//        FileWriter writer = null;
//        try {
//            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
//            writer.write(sWord);
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (writer != null) {
//                try {
//                    writer.close();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//    }
}

