package com.ruoyi.dmw.domain.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.ruoyi.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.Serializable;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;

/**
 * 附件基础信息，统一描述名称、类型、大小与访问地址。
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AttachmentInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    private static final Logger log = LoggerFactory.getLogger(AttachmentInfo.class);

    private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper()
            .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

    /**
     * 前端上传时生成的唯一ID，仅用于前端列表标识
     */
    private String uid;

    private String name;

    private String url;

    /**
     * 约定使用扩展名或自定义类型标识
     */
    private String type;

    /**
     * 以字节为单位的文件大小
     */
    private Long size;

    /**
     * 预览URL（PDF 或图片）
     */
    private String previewUrl;

    public AttachmentInfo() {
    }

    public AttachmentInfo(String name, String url, String type, Long size, String previewUrl) {
        this.name = name;
        this.url = url;
        this.type = type;
        this.size = size;
        this.previewUrl = previewUrl;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Long getSize() {
        return size;
    }

    public void setSize(Long size) {
        this.size = size;
    }

    public String getPreviewUrl() {
        return previewUrl;
    }

    public void setPreviewUrl(String previewUrl) {
        this.previewUrl = previewUrl;
    }

    /**
     * 解析 JSON 数组字符串，兼容历史的单 URL 纯文本写法。
     */
    public static List<AttachmentInfo> parseList(String raw) {
        if (StringUtils.isBlank(raw)) {
            return Collections.emptyList();
        }
        String trimmed = raw.trim();
        if (trimmed.startsWith("[")) {
            try {
                List<AttachmentInfo> list = OBJECT_MAPPER.readValue(trimmed.getBytes(StandardCharsets.UTF_8),
                        new TypeReference<List<AttachmentInfo>>() {});
                return list;
            } catch (IOException ex) {
                log.warn("无法解析附件 JSON，fallback 为单链接: {}", ex.getMessage());
            }
        }
        AttachmentInfo single = new AttachmentInfo();
        single.setUid(String.valueOf(System.currentTimeMillis()));
        single.setUrl(trimmed);
        single.setPreviewUrl(trimmed);
        single.setName(extractName(trimmed));
        single.setType(extractExtension(single.getName()));
        return Collections.singletonList(single);
    }

    /**
     * 生成一个安全的文件名，移除路径及非法字符。
     */
    public String buildSafeName(String fallback) {
        String candidate = StringUtils.isNotBlank(this.name) ? this.name : fallback;
        if (StringUtils.isBlank(candidate)) {
            candidate = "attachment";
        }
        return candidate.replaceAll("[\\\\/:*?\"<>|]", "_");
    }

    private static String extractName(String url) {
        if (StringUtils.isBlank(url)) {
            return "attachment";
        }
        String stripped = StringUtils.substringAfterLast(url, "/");
        return StringUtils.isNotBlank(stripped) ? stripped : url;
    }

    private static String extractExtension(String fileName) {
        if (StringUtils.isBlank(fileName)) {
            return null;
        }
        String ext = StringUtils.substringAfterLast(fileName, ".");
        return StringUtils.isNotBlank(ext) ? ext.toLowerCase() : null;
    }
}
