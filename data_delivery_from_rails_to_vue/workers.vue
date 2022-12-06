<template>
  <div id="workers">
    <input type="checkbox" id="item" value="001">
    <label for="item">稼働中のみ表示</label>
    <table class="table worker-table table-striped">
      <thead class="thead-light">
        <tr class="fix_header">
          <th> ID ↕︎</th>
          <th>名前 ↕︎</th>
          <th>1次代理店 ↕︎</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="worker in workers" :key="worker.id">
          <td>{{ worker.id }}</td>
          <td>{{ worker.name }}</td>
          <td>{{ worker.first_agency.name }}</td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      workers: []
    }
  },
  async mounted() {
    fetch('http://localhost:3002/api/workers')
      .then(response => {
        return response.json()
      })
      .then(data => {
        this.workers = JSON.parse(data.workers)
      })
      .then(error => {
        console.log(error)
      })
  }
}
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
  .worker-table {
    overflow-x: scroll; /* 横スクロール処理 */
    overflow-y: scroll; /* 横スクロール処理 */
    white-space:nowrap;/* 自動改行させない */
    display: block;
    height: 800px;
  }
  .fix_header {
    position: sticky;
    top: 0;
    z-index: 100;
  }
</style>
