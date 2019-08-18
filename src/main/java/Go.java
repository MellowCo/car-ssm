import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Go {
    public static void main(String[] args) throws IOException, XMLParserException, InvalidConfigurationException, SQLException, InterruptedException {
        List<String> warrings = new ArrayList<>();

        ConfigurationParser parser = new ConfigurationParser(warrings);
        File file = new File("src/main/resources/generator.xml");
        Configuration configuration = parser.parseConfiguration(file);

        DefaultShellCallback callBack = new DefaultShellCallback(true);

        MyBatisGenerator generator = new MyBatisGenerator(configuration, callBack, warrings);
        generator.generate(null);
    }
}