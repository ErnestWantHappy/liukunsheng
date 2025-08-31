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
  data: {
    type: Array,
    default: () => []
  },
  title: {
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
  showLegend: {
    type: Boolean,
    default: true
  },
  legendPosition: {
    type: String,
    default: 'right' // right, bottom, top, left
  }
})

const chartOptions = computed(() => {
  const legendConfig = props.showLegend ? {
    show: true,
    orient: props.legendPosition === 'right' || props.legendPosition === 'left' ? 'vertical' : 'horizontal',
    [props.legendPosition]: props.legendPosition === 'bottom' ? 10 : props.legendPosition === 'top' ? 10 : '3%',
    itemGap: 12,
    textStyle: {
      fontSize: 12
    }
  } : { show: false }

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
      trigger: 'item',
      formatter: '{a} <br/>{b}: {c} ({d}%)'
    },
    legend: legendConfig,
    color: props.colors,
    series: [
      {
        name: props.title,
        type: 'pie',
        radius: ['20%', '70%'],
        center: props.legendPosition === 'right' ? ['40%', '50%'] : ['50%', '55%'],
        avoidLabelOverlap: false,
        label: {
          show: true,
          position: 'outside',
          formatter: '{b}: {c}',
          fontSize: 12
        },
        emphasis: {
          label: {
            show: true,
            fontSize: 14,
            fontWeight: 'bold'
          }
        },
        labelLine: {
          show: true
        },
        data: props.data
      }
    ]
  }
})
</script>