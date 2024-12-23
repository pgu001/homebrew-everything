class {REPLACE_WITH_FORMULA_NAME} < Formula
  desc "{REPLACE_WITH_DESCRIPTION}"
  homepage "{REPLACE_WITH_GITHUB_REPO}"
  license "Proprietary"

  # Declare version
  version "{REPLACE_WITH_VERSION}"

  # Download files based on platform and architecture
  if OS.mac?
    if Hardware::CPU.arm?
      # macOS ARM architecture
      url "{REPLACE_WITH_ARM64_URL}"
      sha256 "{REPLACE_WITH_ARM64_SHA256}"
    else
      # macOS x86_64 architecture
      url "{REPLACE_WITH_X86_64_URL}"
      sha256 "{REPLACE_WITH_X86_64_SHA256}"
    end
  end

  # Optional: Specify dependencies if needed
  # depends_on "dependency1"
  # depends_on "dependency2"

  # Optional: Add caveats for special instructions
  def caveats
    <<~EOS
      {REPLACE_WITH_CAVEATS_TEXT}
    EOS
  end

  def install
    # Install main binary
    bin.install "{REPLACE_WITH_BINARY_NAME}"
    
    # Optional: Install additional resources
    # libexec.install "resource_directory"
  end

  # Optional: Service management configuration
  service do
    run [opt_bin/"{REPLACE_WITH_BINARY_NAME}"{REPLACE_WITH_ADDITIONAL_ARGS}]
    keep_alive true
    working_dir HOMEBREW_PREFIX
    log_path var/"log/{REPLACE_WITH_LOG_NAME}.log"
    error_log_path var/"log/{REPLACE_WITH_LOG_NAME}-error.log"
  end

  test do
    # Basic executable test
    assert_predicate bin/"{REPLACE_WITH_BINARY_NAME}", :executable?
    
    # Optional: Add more specific tests
    # system bin/"{REPLACE_WITH_BINARY_NAME}", "--version"
  end
end
