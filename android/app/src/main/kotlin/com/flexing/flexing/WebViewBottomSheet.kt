package com.flexing.flexing


import android.annotation.SuppressLint
import android.content.res.Resources
import android.graphics.Bitmap
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import android.webkit.CookieManager
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.ProgressBar
import androidx.fragment.app.DialogFragment
import com.google.android.material.bottomsheet.BottomSheetBehavior.*
import com.google.android.material.bottomsheet.BottomSheetDialog
import com.google.android.material.bottomsheet.BottomSheetDialogFragment
import timber.log.Timber


class WebViewBottomSheet : BottomSheetDialogFragment(), WebViewLoadingListener {

    private var linkURL = ""

    private var progressBar: ProgressBar? = null
    private var webView: WebView? = null

    fun dismissAndClose() {
        progressBar = null
        webView = null
        linkURL = ""
        dismiss()
    }


    override fun onStart() {
        super.onStart()
        val params = webView?.layoutParams
        params?.height = (Resources.getSystem().displayMetrics.heightPixels).toInt()
        webView?.layoutParams = params
        val maxHeight = WindowManager.LayoutParams.MATCH_PARENT
        val behaviour = from(requireView().parent as View)
        behaviour.peekHeight = maxHeight
        (dialog as? BottomSheetDialog)?.behavior?.state = STATE_EXPANDED
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        val view = LayoutInflater.from(this.context).inflate(
            R.layout.bottom_sheet_web_view, container, false
        )
        linkURL = this.arguments?.getString("", linkURL).toString()
        webView = view.findViewById(R.id.webAppWebView)
        progressBar = view.findViewById(R.id.progressBar)
        return view
    }

    internal inner class WebAppViewClient : WebViewClient() {
        private var mListener: WebViewLoadingListener? = null
        fun setListener(listener: WebViewLoadingListener?) {
            mListener = listener
        }

        @Deprecated(
            "Deprecated in Java", ReplaceWith(
                "super.shouldOverrideUrlLoading(view, url)",
                "android.webkit.WebViewClient"
            )
        )
        override fun shouldOverrideUrlLoading(view: WebView, url: String): Boolean {
            return super.shouldOverrideUrlLoading(view, url)
        }

        override fun onPageStarted(view: WebView, url: String, favicon: Bitmap?) {
            if (mListener != null) mListener!!.startedLoading(url)
            super.onPageStarted(view, url, favicon)
        }

        override fun onPageFinished(view: WebView, url: String) {
            super.onPageFinished(view, url)
            if (mListener != null) mListener!!.completedLoading(url)
        }
    }


    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        initialiseWebView()
    }

    @SuppressLint("SetJavaScriptEnabled")
    private fun initialiseWebView() {
        webView?.settings?.javaScriptEnabled = true
        webView?.settings?.domStorageEnabled = true
        val webAppViewClient = WebAppViewClient()
        webAppViewClient.setListener(this)
        webView?.webViewClient = webAppViewClient
        try {
            val existingUserAgent = webView?.settings?.userAgentString
            if (existingUserAgent?.contains("SmartQ") == false) {
                val newUserAgent = existingUserAgent + " SmartQ/" + BuildConfig.VERSION_CODE
                webView?.settings?.userAgentString = newUserAgent
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
        //val cookies = "cookie=" + getCookie(context)
        val cookieManager = CookieManager.getInstance()
        cookieManager.setAcceptCookie(true)
//       val storedCookie = cookieManager.getCookie(domain)
//        if (storedCookie == null) {
//            cookieManager.setCookie(SERVER_DOMAIN, cookies)
//        } else {
//            if (storedCookie != cookies) {
//                cookieManager.setCookie(SERVER_DOMAIN, cookies)
//            }
//        }
        webView?.loadUrl("https://v.zoyel.one/whiteboard/#room=262506775262506775Aa,262506775262506775Absc")
    }


    override fun startedLoading(url: String?) {
        activity?.runOnUiThread {
            try {
                progressBar?.visibility = View.VISIBLE
            } catch (e: Exception) {
                Timber.e(e)
            }
        }
    }

    override fun completedLoading(url: String?) {
        activity?.runOnUiThread {
            progressBar?.visibility = View.GONE
        }
    }

    companion object {
        fun newInstance(): WebViewBottomSheet {
            return WebViewBottomSheet()
        }
    }
}

interface WebViewLoadingListener {
    fun startedLoading(url: String?)
    fun completedLoading(url: String?)
}