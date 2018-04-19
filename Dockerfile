FROM huggla/tomcat-alpine

ENV REV_param_CATALINA_OPTS="-Xms128m -Xmx756M -XX:SoftRefLRUPolicyMSPerMB=36000 --XX:+UseParNewGC"

RUN downloadDir="$(mktemp -d)" \
 && wget http://data.boundlessgeo.com/suite/jai/jai-1_1_3-lib-linux-amd64-jdk.bin -O "$downloadDir/jai-1_1_3-lib-linux-amd64-jdk.bin" \
 && cd "$JAVA_HOME" \
 && echo "yes" | sh "$downloadDir/jai-1_1_3-lib-linux-amd64-jdk.bin" \
 && wget http://data.opengeo.org/suite/jai/jai_imageio-1_1-lib-linux-amd64-jdk.bin -O "$downloadDir/jai_imageio-1_1-lib-linux-amd64-jdk.bin" \
 && echo "yes" | sh "$downloadDir/jai_imageio-1_1-lib-linux-amd64-jdk.bin" \
 && rm -rf "$downloadDir"
