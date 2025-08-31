<template>
  <BaseChart 
    :options="chartOptions" 
    :height="height" 
    :width="width"
    :theme="theme"
  />
</template>

<script setup>
import BaseChart from './BaseChart.vue'
import { computed } from 'vue'

const props = defineProps({
  xData: {
    type: Array,
    default: () => []
  },
  series: {
    type: Array,
    default: () => []
  },
  title: {
    type: String,
    default: ''
  },
  xAxisName: {
    type: String,
    default: ''
  },
  yAxisName: {
    type: String,
    default: ''
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
  },
  colors: {
    type: Array,
    default: () => ['#409EFF', '#67C23A', '#E6A23C', '#F56C6C', '#909399', '#C45656']
  },
  stack: {
    type: String,
    default: ''
  }
})

const chartOptions = computed(() => {
  return {
    title: {
      text: props.title,
      left: 'center',
      textStyle: {
        fontSize: 16,
        fontWeight: 'bold',
        color: '#303133'
      }
    },
    tooltip: {
      trigger: 'axis',
      axisPointer: {
        type: 'shadow'
      }
    },
    legend: {
      show: props.series.length > 1,
      top: props.title ? 40 : 10,
      data: props.series.map(item => item.name)
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '3%',
      top: props.series.length > 1 ? (props.title ? 80 : 50) : (props.title ? 60 : 30),
      containLabel: true
    },
    color: props.colors,
    xAxis: [
      {
        type: 'category',
        data: props.xData,
        axisTick: {
          alignWithLabel: true
        },
        axisLabel: {
          interval: 0,
          rotate: props.xData.some(item => item.length > 4) ? 45 : 0,
          fontSize: 12
        },
        name: props.xAxisName,
        nameTextStyle: {
          fontSize: 12,
          color: '#666'
        }
      }
    ],
    yAxis: [
      {
        type: 'value',
        name: props.yAxisName,
        nameTextStyle: {
          fontSize: 12,
          color: '#666'
        },
        axisLabel: {
          fontSize: 12
        }
      }
    ],
    series: props.series.map((item, index) => ({
      ...item,
      type: 'bar',
      stack: props.stack || undefined,
      itemStyle: {
        color: props.colors[index % props.colors.length]
      },
      emphasis: {
        focus: 'series'
      }
    }))
  }
})
</script>