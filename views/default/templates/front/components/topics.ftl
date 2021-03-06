<#macro topics topics>
  <#list topics as topic>
    <div class="media">
      <div class="media-left">
        <a href="/user/${topic.username!}"><img src="${topic.avatar}" class="avatar" alt=""></a>
      </div>
      <div class="media-body">
        <div class="title">
          <#if model.isEmpty(topic.url)>
            <a href="/topic/${topic.id}">
              ${topic.title!?html}
            </a>
          <#else>
            <a href="${topic.url!?html}" target="_blank">
              ${topic.title!?html}
              <i class="glyphicon glyphicon-link"></i>
            </a>
          </#if>
        </div>
        <p class="gray">
          <#if (topic.up - topic.down) &gt; 0>
            <i class="fa fa-chevron-up"></i>
            <span>${topic.up - topic.down}</span>
            <span>•</span>
          </#if>
          <#if topic.top == true>
            <span class="label label-primary">置顶</span>
            <span>•</span>
          <#elseif topic.good == true>
            <span class="label label-success">精华</span>
            <span>•</span>
          </#if>
          <span><a href="/user/${topic.username!}">${topic.username!}</a></span>
          <span class="hidden-sm hidden-xs">•</span>
          <span class="hidden-sm hidden-xs"><a href="/topic/${topic.id!c}">${topic.comment_count!0}个评论</a></span>
          <span class="hidden-sm hidden-xs">•</span>
          <span class="hidden-sm hidden-xs">${topic.view!0}次浏览</span>
          <span>•</span>
          <span>${model.formatDate(topic.in_time)}</span>
          <span>•</span>
          <#list topic.tag?split(",") as tag>
            <a href="/topic/tag/${tag}"><span class="label label-success">${tag}</span></a>
          </#list>
        </p>
      </div>
    </div>
    <#if topic_has_next>
      <div class="divide mar-top-5"></div>
    </#if>
  </#list>
</#macro>