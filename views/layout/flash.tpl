{{if .flash}}
    <div style="position:fixed; top:20px; right:5px; z-index: 9999;" class="flash-toast">
        <div id="admin_ni_toast" role="alert" aria-live="assertive" class="toast align-items-center text-white bg-{{if .flash.success}}success{{else if .flash.warning}}warning{{else if .flash.notice}}info{{else if .flash.error}}danger{{end}} border-0 " aria-atomic="true" style="color:{{if .flash.success}}green{{else if .flash.warning}}orange{{else if .flash.notice}}yellow{{else if .flash.error}}red{{end}}">
            <div class="d-flex">
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
                <button aria-label="Close" class="btn-close fs-20 ms-auto mt-2 pe-2" data-bs-dismiss="toast"><span aria-hidden="true">×</span></button>
            </div>
        </div>
    </div>
    
    {{end}}