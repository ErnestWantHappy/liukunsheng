<template>
  <div
    ref="chartRef"
    :style="{ height: height, width: width }"
    class="echarts-container"
  ></div>
</template>

<script setup>
import * as echarts from 'echarts'
import { nextTick, onBeforeUnmount, onMounted, ref, watch } from 'vue'

const props = defineProps({
  options: {
    type: Object,
    required: true
  },
  height: {
    type: String,
    default: '400px'
  },
  width: {
    type: String,
    default: '100%'
  },
  theme: {
    type: String,
    default: 'default'
  }
})

const chartRef = ref()
let chart = null

// 初始化图表
const initChart = async () => {
  await nextTick()
  if (!chartRef.value) return
  
  chart = echarts.init(chartRef.value, props.theme)
  chart.setOption(props.options)
  
  // 添加响应式处理
  window.addEventListener('resize', handleResize)
}

// 更新图表配置
const updateChart = () => {
  if (chart && props.options) {
    chart.setOption(props.options, true)
  }
}

// 处理窗口大小变化
const handleResize = () => {
  if (chart) {
    chart.resize()
  }
}

// 销毁图表
const destroyChart = () => {
  if (chart) {
    window.removeEventListener('resize', handleResize)
    chart.dispose()
    chart = null
  }
}

// 监听配置变化
watch(
  () => props.options,
  () => {
    updateChart()
  },
  { deep: true }
)

onMounted(() => {
  initChart()
})

onBeforeUnmount(() => {
  destroyChart()
})

// 暴露图表实例给父组件
defineExpose({
  chart,
  updateChart,
  handleResize
})
</script>

<style scoped>
.echarts-container {
  min-height: 300px;
}
</style>