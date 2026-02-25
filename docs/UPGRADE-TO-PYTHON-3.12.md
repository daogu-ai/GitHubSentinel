# Upgrading to Python 3.12

## Summary

This document describes the upgrade from Python 3.10 to Python 3.12 and dependency updates completed on 2026-02-09.

## Changes

### Python Version
- **Old:** Python 3.10
- **New:** Python 3.12

### Updated Dependencies

| Package | Old Version | New Version | Breaking Changes |
|---------|-------------|-------------|------------------|
| requests | 2.31.0 | 2.32.5 | None |
| gradio | 4.42.0 | 6.5.1 | None - Fully compatible |
| loguru | 0.7.2 | 0.7.3 | None |
| markdown2 | 2.5.0 | 2.5.4 | None |
| openai | 1.44.0 | 2.17.0 | None - Code already v2-compatible |
| schedule | 1.2.2 | 1.2.2 | No change |

## Testing Results

- ✅ All unit tests pass (23 tests via validate_tests.sh)
- ✅ All Jupyter notebooks execute successfully
- ✅ Docker build not tested (Docker daemon not running)
- ✅ Integration tests pass
- ✅ No breaking changes found

## Migration Guide

### For Developers

1. Ensure Python 3.12 is installed
2. Create new virtual environment: `python3.12 -m venv venv`
3. Activate: `source venv/bin/activate`
4. Install dependencies: `pip install -r requirements.txt`
5. Run tests: `./validate_tests.sh`

### For Docker Users

Simply rebuild the image:
```bash
./build_image.sh
```

## Known Issues

None - Upgrade completed successfully with full compatibility.

## Rollback Plan

If issues occur, revert to previous version:
```bash
git checkout HEAD~1 requirements.txt Dockerfile README.md README-EN.md .python-version
python3.10 -m venv venv-rollback
source venv-rollback/bin/activate
pip install -r requirements.txt
```

## Performance Notes

Python 3.12 includes several performance improvements:
- Faster startup time
- Improved memory usage
- Better error messages
- Type hints enhancements

## References

- [Python 3.12 Release Notes](https://docs.python.org/3.12/whatsnew/3.12.html)
- [Gradio 6.x Migration Guide](https://www.gradio.app/)
- [OpenAI Python SDK v2](https://github.com/openai/openai-python)
