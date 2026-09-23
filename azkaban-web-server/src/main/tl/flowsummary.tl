<div class="row">
  <div class="col-xs-12">
    <table class="table table-bordered table-condensed">
      <tbody>
      <tr>
        <td class="property-key">项目名称</td>
        <td>{projectName}</td>
      </tr>
      <tr>
        <td class="property-key">使用的作业类型</td>
        <td>{#jobTypes}{.} {/jobTypes}</td>
      </tr>
      <tr>
        <td class="property-key">条件</td>
        {?condition}
          <td>{condition}</td>
        {:else}
          <td>无</td>
        {/condition}
      </tr>
      </tbody>
    </table>
  </div>
</div>

<div class="row">
  <div class="col-xs-12">
    <h3>
      调度
      {?schedule}
        <div class="pull-right">
          <button type="button" id="removeSchedBtn" class="btn btn-sm btn-danger"
                  onclick="removeSched({schedule.scheduleId})">移除调度
          </button>
        </div>
      {/schedule}
    </h3>
    {?schedule}
      <table class="table table-condensed table-bordered">
        <tbody>
        <tr>
          <td class="property-key">调度 ID</td>
          <td class="property-value-half">{schedule.scheduleId}</td>
          <td class="property-key">提交人</td>
          <td class="property-value-half">{schedule.submitUser}</td>
        </tr>
        <tr>
          <td class="property-key">首次计划运行时间</td>
          <td class="property-value-half">{schedule.firstSchedTime}</td>

          <td class="property-key">
            {?schedule.cronExpression}
              Cron 表达式
            {:else}
              重复间隔
            {/schedule.cronExpression}
          </td>

          <td class="property-value-half">
            {?schedule.cronExpression}
              {schedule.cronExpression}
            {:else}
              {schedule.period}
            {/schedule.cronExpression}
          </td>

        </tr>
        <tr>
          <td class="property-key">下次执行时间</td>
          <td class="property-value-half">{schedule.nextExecTime}</td>
          <td class="property-key">SLA</td>
          <td class="property-value-half">
            {?schedule.slaOptions}
              已设置
            {:else}
              未设置
            {/schedule.slaOptions}
            <div class="pull-right">
              <button type="button" id="addSlaBtn" class="btn btn-xs btn-primary"
                      onclick="slaView.initFromSched({schedule.scheduleId}, '{flowName}')">查看/设置
                SLA
              </button>
            </div>
          </td>
        </tr>
        </tbody>
      </table>
    {:else}
      <div class="callout callout-default">
        <h4>无</h4>
        <p>该工作流尚未调度。</p>
      </div>
    {/schedule}

    <div class="row">
      <div class="col-xs-12">
        <h3>
          工作流触发器
        </h3>
        {?flowtrigger}
          <table class="table table-condensed table-bordered">
            <tbody>
            <tr>
              <td class="property-key">最大等待分钟数</td>
              <td class="property-value-half">{flowtrigger.maxWaitMin}</td>
              <td class="property-key">提交人</td>
              <td class="property-value-half">{flowtrigger.submitUser}</td>
            </tr>
            <tr>
              <td class="property-key">首次计划运行时间</td>
              <td class="property-value-half">{flowtrigger.firstSchedTime}</td>

              <td class="property-key">
                Cron 表达式
              </td>

              <td class="property-value-half">
                {?flowtrigger.cronExpression}
                  {flowtrigger.cronExpression}
                {/flowtrigger.cronExpression}
              </td>

            </tr>
            <tr>
              <td class="property-key">下次执行时间</td>
              <td class="property-value-half">{flowtrigger.nextExecTime}</td>
              <td class="property-key">是否有依赖</td>
              <td class="property-value-half">
                {?flowtrigger.dependencies}
                  是
                {:else}
                  否
                {/flowtrigger.dependencies}
                <div class="pull-right">
                  <button type="button" id="showFlowTrigger" data-toggle="modal"
                          class="btn btn-sm btn-info" data-target="#dependencyList">查看依赖
                  </button>
                </div>

                <div class="modal fade" id="dependencyList" tabindex="-1"
                     role="dialog"
                     aria-labelledby="dependencyLabel">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="dependencyLabel">依赖</h4>
                      </div>
                      <div class="modal-body">
                        <pre>{flowtrigger.dependencies}</pre>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                      </div>
                    </div>
                  </div>
                </div>

              </td>
            </tr>
            </tbody>
          </table>
        {:else}
          <div class="callout callout-default">
            <h4>无</h4>
            <p>该工作流没有工作流触发器。</p>
          </div>
        {/flowtrigger}

      </div>

      <h3>上次运行统计</h3>
    </div>
  </div>
