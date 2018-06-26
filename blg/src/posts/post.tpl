<div class="off-canvas off-canvas-sidebar-show">
  <div id="navigation" class="off-canvas-sidebar">
    <ul class="menu menu-nav">
      <li class="menu-item"><a href='index.html'>Go back</a></li>
    </ul>
    <div class="divider"></div>
    $toc
  </div>

  <a class="off-canvas-overlay" href="#close"></a>

  <div id="content" class="off-canvas-content">
    <div id="top-navbar">
      <a class="off-canvas-toggle btn btn-primary btn-action" href="#navigation">
        <i class="icon icon-menu"></i>
      </a>
    </div>
    $text
    <div id="comments">
      <template v-if="maxPage > 0">
        <div class="panel">
          <div class="panel-header">
            <div class="panel-title text-center">
              <h4>Comments</h4>
              <p>Click the button to contribute to the discussion</p>
              <a :href="newURL"><button class="btn">Write Comment</button></a>
            </div>
          </div>
          <div class="divider" v-if="maxPage > 1"></div>
          <div class="centered" v-if="maxPage > 1">
            <ul class="pagination">
              <template v-for="navPage in maxPage">
                <li class="page-item" v-if="page != navPage">
                  <a href="#comments" @click="page = navPage">{{ navPage }}</a>
                </li>
                <li class="page-item active" v-if="page == navPage">
                  <a>{{ navPage }}</a>
                </li>
              </template>
            </ul>
          </div>
          <div class="divider"></div>
          <div class="panel-body">
            <div v-for="comment in comments" class="tile">
              <div class="tile-icon">
                <figure class="avatar"><img :src="comment.user.avatar_url" /></figure>
              </div>
              <div class="tile-content">
                <p class="tile-title">
                  <span class="text-bold">{{ comment.user.login }}</span>
                  <span class="text-gray">wrote {{ comment.created_at | moment }}</span>
                </p>
                <p class="tile-subtitle" v-html="comment.body_html"></p>
              </div>
            </div>
          </div>
          <!--<div class="panel-footer"></div>-->
        </div>
      </template>
      <template v-if="maxPage == 0">
        <div class="empty">
          <div class="empty-icon">
            <i class="icon icon-3x icon-mail"></i>
          </div>
          <p class="empty-title h5">There are no comments</p>
          <p class="empty-subtitle">Click the button to start a conversation.</p>
          <div class="empty-action">
            <a :href="newURL"><button class="btn">Write Comment</button></a>
          </div>
        </template>
      </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.16/vue.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script src="assets/ghcmt.js"></script>
    <script>initComments('Anachron/void', $issue);</script>
  </div>
</div>