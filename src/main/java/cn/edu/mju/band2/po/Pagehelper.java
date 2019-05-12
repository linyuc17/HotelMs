package cn.edu.mju.band2.po;

import com.github.pagehelper.PageInterceptor;
import org.springframework.context.annotation.Bean;

import java.util.Properties;

public class Pagehelper {
    @Bean(name = "pageHelper")
    public PageInterceptor pageHelper(){
        PageInterceptor pageHelper = new PageInterceptor();
        Properties properties = new Properties();
        /**默认false，设置为true时，会将RowBounds第一个参数offset当成pageNum页码使用*/
        properties.setProperty("offsetAsPageNum","true");
        /**默认false，设置为true时，使用RowBounds分页会进行count查询 */
        properties.setProperty("rowBoundsWithCount","true");
        /** 禁用合理化时，如果pageNum<1或pageNum>pages会返回空数据 */
        properties.setProperty("reasonable","true");
        /** always总是返回PageInfo类型,check检查返回类型是否为PageInfo,none返回Page */
        properties.setProperty("returnPageInfo","check");
        /** 支持通过Mapper接口参数来传递分页参数 */
        properties.setProperty("supportMethodsArguments","false");
        /**  配置数据库的方言  */
        properties.setProperty("helperDialect","oracle");
        pageHelper.setProperties(properties);
        return pageHelper;
    }

}
