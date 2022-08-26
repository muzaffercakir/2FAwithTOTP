{{if .flash}}
<div style="position:fixed; top:10px; right:2px; z-index: 9999;" class="flash-toast">
    <div class="toast text-white bg-{{if .flash.success}}success{{ else if .flash.warning }}warning{{ else if .flash.notice }}info{{ else if .flash.error }}danger{{end}}"
        role="alert" aria-live="assertive" aria-atomic="true" data-bs-delay="2000" >
        <div class="d-flex ">
            <div class="toast-body">
                {{if .flash.success}}
                {{.flash.success}}
                {{else if .flash.warning}}
                {{.flash.warning}}
                {{else if .flash.notice}}
                {{.flash.notice}}
                {{else if .flash.error}}
                {{.flash.error}}
                {{end}}
            </div>
            <button aria-label="Close" class="btn-close fs-20 ms-auto mt-2 pe-3" data-bs-dismiss="toast"><span aria-hidden="true"></span></button>
        </div>
    </div>
</div>

{{end}}